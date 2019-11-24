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

LATERAL_SPEED           = 10
TURNING_SPEED           = 12
FAST_FALL_AWAIT_COUNTER = 30

FADING_TIME             = 33

Grid = Struct.new :hor_size, :ver_size, keyword_init: true do
  attr_accessor :matrix

  def initialize(*args)
    super
    self.matrix = Matrix.build(hor_size, ver_size) { 0 }
  end
  
  def update 
  end

  def draw(x, y)
    controller = x

    (0...ver_size).each do |j|
      (0...hor_size).each do |i|
        if matrix[i, j] == :empty || matrix[i, j] == 0 || matrix[i, j] == 8
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
  attr_reader :gridx, :gridy
  def initialize(*args)
    super
    @matrix = Matrix.build(hor_size, ver_size) { 4 }
puts @matrix.inspect
# puts (@matrix.methods-Object.methods).sort.inspect
# [:*, :**, :+, :+@, :-, :-@, :/, :Fail, :Raise, :[], :[]=, :adjugate, :all?, :antisymmetric?, :any?, :chain, :chunk, :chunk_while, :coerce, :cofactor, :cofactor_expansion, :collect, :collect!, :collect_concat, :column, :column_count, :column_size, :column_vectors, :combine, :component, :conj, :conjugate, :count, :cycle, :det, :det_e, :detect, :determinant, :determinant_e, :diagonal?, :drop, :drop_while, :each, :each_cons, :each_entry, :each_slice, :each_with_index, :each_with_object, :eigen, :eigensystem, :element, :elements_to_f, :elements_to_i, :elements_to_r, :empty?, :entries, :entrywise_product, :filter, :find, :find_all, :find_index, :first, :first_minor, :flat_map, :grep, :grep_v, :group_by, :hadamard_product, :hermitian?, :hstack, :imag, :imaginary, :index, :inject, :inv, :inverse, :laplace_expansion, :lazy, :lower_triangular?, :lup, :lup_decomposition, :map, :map!, :max, :max_by, :member?, :min, :min_by, :minmax, :minmax_by, :minor, :none?, :normal?, :one?, :orthogonal?, :partition, :permutation?, :rank, :rank_e, :real, :real?, :rect, :rectangular, :reduce, :regular?, :reject, :reverse_each, :round, :row, :row_count, :row_size, :row_vectors, :rows, :select, :singular?, :skew_symmetric?, :slice_after, :slice_before, :slice_when, :sort, :sort_by, :square?, :sum, :symmetric?, :t, :take, :take_while, :to_a, :to_h, :to_matrix, :to_set, :tr, :trace, :transpose, :uniq, :unitary?, :upper_triangular?, :vstack, :zero?, :zip]

    # @gridx=GRID_HORIZONTAL_SIZE/2;  @gridy = 0;
    @gridx=0;  @gridy = 0;
    @frames = 0
    # @y = 25
    # @x = 50
  end 
  
  def at_bottom?
  
  end
  def grid_cross(tgrid)
    # tg2 = Matrix.build(PIECE_GRID_DIM,PIECE_GRID_DIM) { :empty }
    # (0...PIECE_GRID_DIM).each do |j|
    #   (0...PIECE_GRID_DIM).each do |i|
    #     tg2[i,j] = tgrid[@gridx+i, @gridy+j]
    #   end 
    # end
    # puts tg2.inspect
    puts tgrid.inspect
    # byebug
  end

  def draw(x,y)
    drawx = x || @x; drawy=y || @y
    oux, ouy = super drawx, drawy
    # RayDraw.rectangle @x, @y, SQUARE_SIZE, SQUARE_SIZE, RayColor::GREEN
    return oux, ouy
  end
  
  def update
    if RayKey.is_pressed? RayKey::LEFT
      @gridx -= 1
    elsif RayKey.is_pressed? RayKey::RIGHT
      @gridx += 1
    elsif RayKey.is_down? RayKey::UP
      @matrix.rotate_x(90)
    elsif RayKey.is_down? RayKey::DOWN
    end

    @frames += 1
    @gridy += 1 if @frames % 35 == 0
    @x = 230 + @gridx * SQUARE_SIZE
    @y = 25 + @gridy * SQUARE_SIZE
    # puts "piece frames #{@frames}"
    # puts "gridx #{@gridx}"
    # puts "gridy #{@gridy}"
  end
end

class LeftL < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 213,41,176,255
    @matrix = Matrix.build(hor_size, ver_size) { 8 }
    @matrix[0,2]=:falling
    @matrix[0,3]=:falling
    @matrix[1,3]=:falling
    @matrix[2,3]=:falling
    @matrix[3,3]=:falling
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
    self.falling = LeftL.new hor_size: PIECE_GRID_DIM, ver_size: PIECE_GRID_DIM
    self.incoming = LeftL.new hor_size: PIECE_GRID_DIM, ver_size: PIECE_GRID_DIM
    self.lines = 0
    self.level = 1
  end

  def init; end
  
  def grid_sub(matr, piece)
    # return an array of 4 horizontal arrays
    # that are a chunk of the game grid, starting at 
    # the piece's gridx,gridy coordinates
    out = Matrix.build(PIECE_GRID_DIM,PIECE_GRID_DIM){ 0 }
    (0...PIECE_GRID_DIM).each do |j|
      (0...PIECE_GRID_DIM).each do |i|
        piece.gridx..piece.gridx+PIECE_GRID_DIM
        out[i,j] = matr[piece.gridx+i,piece.gridy+j]
      end
    end
    return out
  end
  
  def update;
    @grid.update 
    @incoming.update
    @falling.grid_cross( grid_sub(@grid.matrix, @falling) )
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
