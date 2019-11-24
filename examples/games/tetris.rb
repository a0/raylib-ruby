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

SQUARE_SIZE             = 20

GRID_HORIZONTAL_SIZE    = 12
GRID_VERTICAL_SIZE      = 20

LATERAL_SPEED           = 10
TURNING_SPEED           = 12
FAST_FALL_AWAIT_COUNTER = 30

FADING_TIME             = 33

Grid = Struct.new :hor_size, :ver_size, keyword_init: true do
  attr_accessor :matrix

  def initialize(*args)
    super
    self.matrix = Matrix.build(hor_size, ver_size) { :empty }
  end
  
  def update 
  end

  def draw(x, y)
    controller = x

    (0...ver_size).each do |j|
      (0...hor_size).each do |i|
        if matrix[i, j] == :empty
          RayDraw.line x, y, x + SQUARE_SIZE, y, RayColor::LIGHTGRAY
          RayDraw.line x, y, x, y + SQUARE_SIZE, RayColor::LIGHTGRAY
          RayDraw.line x + SQUARE_SIZE, y, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::LIGHTGRAY
          RayDraw.line x, y + SQUARE_SIZE, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::LIGHTGRAY
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
        elsif matrix[i, j] == :falling
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, falling_color
          x += SQUARE_SIZE
        end
      end

      x = controller
      y += SQUARE_SIZE
    end

    [x, y]
  end
end

class Piece < Grid;
  attr_accessor :falling_color
  def initialize(*args)
    super
    @matrix = Matrix.build(hor_size, ver_size) { :empty }
puts (@matrix.methods-Object.methods).sort.inspect
# [:&, :^, :rationalize, :to_a, :to_c, :to_f, :to_h, :to_i, :to_r, :|]

    @frames = 0
    @y = 25
    @x = 50
  end 
  
  def draw(x,y)
    @x = x if x
    @y = y if y
    oux, ouy = super @x,@y
    # RayDraw.rectangle @x, @y, SQUARE_SIZE, SQUARE_SIZE, RayColor::GREEN
    return oux, ouy
  end
  
  def update
    if RayKey.is_pressed? RayKey::LEFT
      @x -= SQUARE_SIZE
    elsif RayKey.is_pressed? RayKey::RIGHT
      @x += SQUARE_SIZE
    elsif RayKey.is_down? RayKey::UP
      @matrix.rotate_x(90)
    elsif RayKey.is_down? RayKey::DOWN
    end
    @frames += 1
    @y += SQUARE_SIZE if @frames % 35 == 0
    puts "piece frames #{@frames}"
  end
end

class LeftL < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 213,41,176,255
    @matrix = Matrix.build(hor_size, ver_size) { :empty }
    @matrix[0,0]=:falling
    @matrix[0,1]=:falling
    @matrix[1,1]=:falling
    @matrix[2,1]=:falling
    @matrix[3,1]=:falling
  end

end

class Game
  attr_accessor :screen_w, :screen_h, :over, :pause, :level, :grid, 
    :incoming, :falling, :lines

  def initialize
    @over=false
    @pause=false
    self.screen_w = 800
    self.screen_h = 450
    self.grid = Grid.new hor_size: GRID_HORIZONTAL_SIZE, ver_size: GRID_VERTICAL_SIZE
    self.falling = LeftL.new hor_size: 4, ver_size: 4
    self.incoming = LeftL.new hor_size: 4, ver_size: 4
    self.lines = 0
    self.level = 1
  end

  def init; end

  def update;
    @grid.update 
    @incoming.update
    @falling.update
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
        x = 500
        y = 45
        x, y = incoming.draw(x,y)
        RayDraw.text 'INCOMING:', x, y - 100, 10, RayColor::GRAY
        RayDraw.text format('LINES:    %04i', lines), x, y + 20, 10, RayColor::GRAY
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
      update
      draw
    end
    unload

    RayWindow.close
  end
end

Game.new.run
