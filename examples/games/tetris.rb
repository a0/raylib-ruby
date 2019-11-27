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
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

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

Plonk = RaySound.load './plonk.wav'
Pling = RaySound.load './pling.wav'
Schmock = RaySound.load './schmock.wav'
Klunk = RaySound.load './klunk.wav'
Gameover = RaySound.load './gameover.wav'
# fx_ogg = RaySound.load 'resources/tanatana.ogg'


Grid = Struct.new :hor_size, :ver_size, :gmtr, keyword_init: true do
  attr_accessor :matrix 
  attr_reader :gmtr
  def initialize(*args)
    super
    @gmtr=args.first[:gmtr]
    # @frozen_colors = [[nil*GRID_VERTICAL_SIZE]*GRID_HORIZONTAL_SIZE]
    # puts "Grid initialize #{@gmtr}"
    @matrix = Matrix.build(hor_size, ver_size) { 0 }
  end
  
  def update 
  end

  def freeze_in!(piece)
    return unless piece.disposition == FALLING && piece.stopped?
    # Klunk.play
    (0...PIECE_GRID_DIM).each do |j|
      (0...PIECE_GRID_DIM).each do |i|
# puts "f G: " + @matrix.to_s
# puts "f P: " + piece.matrix.to_s
        if @matrix[ i+piece.gridx, j+piece.gridy ] == EMPTY &&
          piece.matrix[i,j] == FALLING
          @matrix[i+piece.gridx,j+piece.gridy] = piece.falling_color 
        end
      end
    end

    piece.disposition = FROZEN
    return piece
  end

  def draw(x, y)
    controller = x
    (0...ver_size).each do |j|
      (0...hor_size).each do |i|
        if matrix[i, j] == EMPTY || matrix[i, j] == FALLING 
          RayDraw.line x, y, x + SQUARE_SIZE, y, RayColor::LIGHTGRAY
          RayDraw.line x, y, x, y + SQUARE_SIZE, RayColor::LIGHTGRAY
          RayDraw.line x + SQUARE_SIZE, y, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::LIGHTGRAY
          RayDraw.line x, y + SQUARE_SIZE, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::LIGHTGRAY
          # RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, falling_color
          x += SQUARE_SIZE
        elsif matrix[i, j] == :full
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, RayColor::GRAY
          x += SQUARE_SIZE
        elsif matrix[i, j] == :moving
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, RayColor::DARKGRAY
          x += SQUARE_SIZE
        elsif matrix[i, j] == :block
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, RayColor::LIGHTGRAY
          x += SQUARE_SIZE
        elsif matrix[i, j] == :fading
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, fading_color
          x += SQUARE_SIZE
        elsif matrix[i, j].is_a?(RayColor)
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, matrix[i, j]
          x += SQUARE_SIZE
        elsif matrix[i, j] == FALLING
          # RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, falling_color
          x += SQUARE_SIZE
        end
      end

      x = controller
      y += SQUARE_SIZE
    end

    [x, y]
  end
end

class Piece < Grid
  attr_accessor :falling_color, :disposition, :gridy
  attr_reader :gridx, :stopped

  def initialize(*args)
    super
    @matrix = Matrix.build(hor_size, ver_size) { INCOMING }
    @frames = 0
    @gridx=GRID_HORIZONTAL_SIZE/2-2 ;  @gridy = 0;
  end 

  def draw(x, y)
    @x = 230 + @gridx * SQUARE_SIZE
    @y = 25 + @gridy * SQUARE_SIZE

    drawx = x || @x; drawy=y || @y
    x=drawx; y = drawy
    if @disposition == FALLING || @disposition == INCOMING
      (0...PIECE_GRID_DIM).each do |j|
        (0...PIECE_GRID_DIM).each do |i|
          if matrix[i, j] == EMPTY
            RayDraw.line x, y, x + SQUARE_SIZE, y, RayColor::GOLD
            RayDraw.line x, y, x, y + SQUARE_SIZE, RayColor::GOLD
            RayDraw.line x + SQUARE_SIZE, y, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::GOLD
            RayDraw.line x, y + SQUARE_SIZE, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::GOLD
            x += SQUARE_SIZE
          else
            RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, falling_color
            x += SQUARE_SIZE
          end
        end
        x=drawx
        y += SQUARE_SIZE
      end
      oux = @x
      ouy = @y
    else
      oux, ouy = super drawx, drawy
    end
    return oux, ouy
  end
  
  def get_padding
    mtrx=@matrix
    tp = 0; bp = 0; lp = 0; rp = 0
    tpdone = false; bpdone = false
    lpdone = false; rpdone = false
    ary=[0,1,2,3]
    (0...PIECE_GRID_DIM).each do |v|
      if tpdone == false
        if ary.all?{ |h| mtrx[h,v] == EMPTY } 
          tp += 1
        else
          tpdone = true
        end
      else
        if ary.all?{ |h| mtrx[h,v] == EMPTY } 
          bp = PIECE_GRID_DIM - v
          break
        end
      end
    end
    (0...PIECE_GRID_DIM).each do |h|
      if lpdone == false
        if ary.all?{ |v| mtrx[h,v] == EMPTY } 
          lp += 1
        else 
          lpdone = true
        end
      else
        if ary.all?{ |v| mtrx[h,v] == EMPTY } 
          rp = PIECE_GRID_DIM - h
          break
        end
      end
    end
    # puts "paddings: " + [tp, bp, lp, rp].inspect 
    @top_pad, @bottom_pad, @left_pad, @right_pad = 
      tp, bp, lp, rp
    return @top_pad, @bottom_pad, @left_pad, @right_pad
  end

  def rotate!(dir=:left)
    # remember update @pad_blanks
    return @matrix unless disposition==FALLING
    nmatrix = Matrix.build(PIECE_GRID_DIM, PIECE_GRID_DIM) { EMPTY }

# puts "before: " + @matrix.to_s
    (0...PIECE_GRID_DIM).each do |v|
      (0...PIECE_GRID_DIM).each do |h|
        # nmatrix[h,v]=EMPTY
        nmatrix[h,v]=@matrix[v,PIECE_GRID_DIM-h-1]
      end
    end
# puts "after : " + nmatrix.to_s

    @matrix = nmatrix
    get_padding
    return @matrix
  end
  
  def at_bottom?
    out = @gridy - @bottom_pad + PIECE_GRID_DIM >= GRID_VERTICAL_SIZE
    # puts "at_bottom? #{@bottom_pad}, #{@gridy}, #{out}"
    return out 
  end
  
  def grid_sub
    # return an array of 4 horizontal arrays
    # that are a chunk of the game grid, starting at 
    # the piece's gridx,gridy coordinates
    out = Matrix.build(PIECE_GRID_DIM,PIECE_GRID_DIM){ 0 }
    (0...PIECE_GRID_DIM).each do |j|
      (0...PIECE_GRID_DIM).each do |i|
        @gridx..@gridx+PIECE_GRID_DIM
        out[i,j] = @gmtr[@gridx+i, @gridy+j+1]
      end
    end
    return out
  end
  
  def stopped?
    tgrid = grid_sub
    if at_bottom?
      return true 
    end 
    gvecs=tgrid.column_vectors
    pvecs=@matrix.column_vectors
    # puts "G:"+tgrid.column_vectors.inspect
    c=PIECE_GRID_DIM - 1
    # byebug if at_bottom?
# puts "P: " + pvecs.inspect
# puts "G: " + gvecs.inspect
    while c >= 0 do
      pvecs[c].each_with_index do |pv,pi|
        if pv == FALLING && gvecs[c][pi] != EMPTY
          return true
        end
      end
      c -= 1
    end
  end

  def can_left? 
    return false if @gridx + @left_pad < 1
    lefti = @gridx-1+@left_pad
    (0...PIECE_GRID_DIM).each do |vi|
      return false if @matrix[@left_pad,vi] == FALLING && 
      @gmtr[lefti,@gridy + vi] != EMPTY
    end
    return true  
  end
  
  def can_right?
    return false if GRID_HORIZONTAL_SIZE  < (1 + @gridx + PIECE_GRID_DIM - @right_pad)
    righti = @gridx+PIECE_GRID_DIM-@right_pad
    (0...PIECE_GRID_DIM).each do |vi|
      return false if @matrix[PIECE_GRID_DIM-@right_pad-1,vi] == FALLING && 
      @gmtr[righti,@gridy + vi] != EMPTY
    end
    return true
  end

  def update(game_grid_matrix)
    return if !@disposition == FALLING
    @gmtr=game_grid_matrix
    down_pressed = false
    if RayKey.is_pressed? RayKey::LEFT
      if can_left?
        @gridx -= 1 
      end
    elsif RayKey.is_pressed? RayKey::RIGHT
      @gridx += 1 if can_right?
    elsif RayKey.is_pressed? RayKey::UP
      @matrix = rotate!(90)
    elsif RayKey.is_down?( RayKey::DOWN )
      down_pressed = true
    end

    @frames += 1
    if !at_bottom? && !stopped?
      if down_pressed
        @gridy += 1
      else  
        @gridy += 1 if @frames % 35 == 0 
      end
    end
  end
end

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
    # klass = [Cube].sample
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
        # puts "handle_completed_rows col, row: #{cl2}, #{crow} => #{@grid.matrix[cl2,crow]}"
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
