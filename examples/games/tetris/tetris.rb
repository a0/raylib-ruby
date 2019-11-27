# /*******************************************************************************************
# *
# *   raylib - sample game: tetris
# *
# *   Sample game Marc Palau and Ramon Santamaria
# *
# *   This game has been created using raylib v1.3 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2015 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq), David Heitzman daveheitzman@github.com

# FIXME: WIP, not fully ported yet
require 'raylib'
require 'matrix'
require 'byebug'

SQUARE_SIZE             = 20
PIECE_GRID_DIM          = 4
GRID_HORIZONTAL_SIZE    = 12
GRID_VERTICAL_SIZE      = 20
AFTER_STOP_GRACE_PERIOD = 15

LATERAL_SPEED           = 10
TURNING_SPEED           = 12
FAST_FALL_AWAIT_COUNTER = 30

FADING_TIME             = 33

# square dispositions
EMPTY                   = 0
INCOMING                = 4
FALLING                 = 8
FROZEN                  = 16

RayAudioDevice.init # Initialize audio device
RayAudioDevice.master_volume=0.2

Pling = RaySound.load './pling.ogg'
Klunk = RaySound.load './klunk.wav'
Gameover = RaySound.load './gameover.ogg'

require_relative 'tetris-grid'
require_relative 'tetris-piece'
require_relative 'tetris-pieces'

class Game
  attr_accessor :screen_w, :screen_h, :over, :pause, :level, :grid, 
    :incoming, :falling, :lines, :score

  def initialize
    @game_over=false
    @pause=false
    @score=0
    @after_stopped_grace=AFTER_STOP_GRACE_PERIOD
    self.screen_w = 800
    self.screen_h = 450
    self.grid = Grid.new hor_size: GRID_HORIZONTAL_SIZE, ver_size: GRID_VERTICAL_SIZE
    self.falling = make_new_incoming
    self.falling.disposition = FALLING
      
    self.incoming = make_new_incoming
    self.incoming.disposition = INCOMING

    self.lines = 0
    self.level = 1
  end

  def init; end
  
  def make_new_incoming
    klass = [LeftL, RightL, Bar, Cube, Sniggle, Piggle].sample
    out = klass.new hor_size: PIECE_GRID_DIM, ver_size: PIECE_GRID_DIM, gmtr: self.grid.matrix
    out.disposition = INCOMING
    out 
  end
  
  def remove_row(row)
    puts "remove row!"
    (1..row).to_a.reverse.each do |srow|
      (0...GRID_HORIZONTAL_SIZE).each{ |col| 
        @grid.matrix[col,srow] = @grid.matrix[col,srow-1]
      }
    end
    (0...GRID_HORIZONTAL_SIZE).each{ |col| 
      @grid.matrix[col,0] = EMPTY
    }
  end
  
  def handle_completed_rows
    crow=GRID_VERTICAL_SIZE-1
    removed_count = 0
    while crow > -1
      if (0...GRID_HORIZONTAL_SIZE).to_a.each{ |cl2| 
        if @grid.matrix[cl2,crow] == EMPTY
          break
        end 
      }
        remove_row(crow) 
        Pling.play
        @score += 100*(2**removed_count)      
        removed_count += 1
        @lines += 1
      else
        crow -= 1
      end 
    end 
  end

  def update
    @grid.update 
    if @falling.disposition == FALLING &&
    @falling.stopped?
      Klunk.play if @after_stopped_grace==AFTER_STOP_GRACE_PERIOD
      if @after_stopped_grace == 0
        @grid.freeze_in!(@falling)
        @score += 10
        @falling.disposition = FROZEN
        @falling = @incoming
        if @falling.stopped?
          Gameover.play          
          puts "game over!!"
          @game_over = true
        end
        @falling.disposition = FALLING
        @incoming = make_new_incoming
        handle_completed_rows
        @after_stopped_grace = AFTER_STOP_GRACE_PERIOD
      else
        if !@falling.can_left? && !@falling.can_right?
          @after_stopped_grace = 0
        else
          @after_stopped_grace -= 1
        end
        @falling.update(@grid.matrix)
      end
    else
      @falling.update(@grid.matrix)
    end
  end

  def draw
    RayDraw.begin_drawing do
      RayDraw.clear_background RayColor::RAYWHITE
      if over
      elsif pause
      else
        x = screen_w / 2 - GRID_HORIZONTAL_SIZE * SQUARE_SIZE / 2 - 50
        y = screen_h / 2 - (GRID_VERTICAL_SIZE - 1)* SQUARE_SIZE / 2 + SQUARE_SIZE * 2 - 50

        grid.draw x, y
        fallx, fally = falling.draw(nil,nil)

        # show incoming piece 
        x = 500 ;y = 45
        incoming.draw(x,y)
        x = 500 ;y = 20
        RayDraw.text 'INCOMING:', x, y , 10, RayColor::GRAY
        x = 500 ;y = 135
        RayDraw.text format('LINES:     %05i', lines), x, y , 10, RayColor::GRAY
        x = 500 ;y = 145
        RayDraw.text format('SCORE:    %05i', @score), x, y , 10, RayColor::BLACK
        if @game_over 
          x = 265 ;y = 200
          RayDraw.text format('GAME OVER', @score), x, y , 40, RayColor::BLACK
        end
      end
    end
  end

  def unload; end

  def run
    puts "screen_w: #{screen_w} screen_h: #{screen_h}"
    RayWindow.init screen_w, screen_h, 'ruby sample game: tetris'
    RayWindow.target_fps = 60

    init
    until RayWindow.should_close?
      update unless @game_over
      draw
    end
    unload

    RayWindow.close
  end
end

Game.new.run
