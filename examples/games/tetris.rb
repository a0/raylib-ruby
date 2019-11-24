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

# square dispositions
EMPTY                   = 0
INCOMING                = 4
FALLING                 = 8
FROZEN                  = 16

Grid = Struct.new :hor_size, :ver_size, keyword_init: true do
  attr_accessor :matrix
  def initialize(*args)
    super
    # @frozen_colors = [[nil*GRID_VERTICAL_SIZE]*GRID_HORIZONTAL_SIZE]
    self.matrix = Matrix.build(hor_size, ver_size) { 0 }
  end
  
  def update 
  end

  def freeze_in!(piece)
    return unless piece.disposition == FALLING && piece.stopped == true
    (0...ver_size).each do |j|
      (0...hor_size).each do |i|
puts @matrix[ i+piece.gridx, j+piece.gridy ].to_s
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
    @matrix = Matrix.build(hor_size, ver_size) { 4 }
puts @matrix.inspect
# puts (@matrix.methods-Object.methods).sort.inspect
# [:eigen, :lup, :lup_decomposition, :row_vectors, :column_vectors, :elements_to_f, :elements_to_i, :elements_to_r, :Fail, :/, :coerce, :real?, :zero?, :round, :rectangular, :rect, :real, :imaginary, :imag, :+@, :-@, :**, :conj, :conjugate, :rows, :row, :row_count, :column_count, :trace, :column, :vstack, :hstack, :combine, :Raise, :element, :t, :to_matrix, :row_size, :column_size, :minor, :tr, :first_minor, :cofactor, :square?, :determinant, :adjugate, :laplace_expansion, :cofactor_expansion, :diagonal?, :hermitian?, :lower_triangular?, :normal?, :orthogonal?, :permutation?, :regular?, :singular?, :symmetric?, :antisymmetric?, :skew_symmetric?, :unitary?, :upper_triangular?, :inverse, :hadamard_product, :entrywise_product, :inv, :eigensystem, :det, :determinant_e, :component, :det_e, :rank, :rank_e]

    # @gridx=GRID_HORIZONTAL_SIZE/2;  @gridy = 0;
    @gridx=0;  @gridy = 0;
    @frames = 0
    # @y = 25
    # @x = 50
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

  def rotate!
    # remember update @pad_blanks
  end
  
  def at_bottom?
    out = @gridy + @pad_blanks + PIECE_GRID_DIM >= GRID_VERTICAL_SIZE
    puts "at_bottom? #{out}"
    return out 
  end
  
  def stopped?(tgrid)
    return @stopped if @stopped
    if at_bottom?
      return @stopped = true 
    end 
    # return @stopped if @stopped
    # tg2 = Matrix.build(PIECE_GRID_DIM,PIECE_GRID_DIM) { :empty }
    # (0...PIECE_GRID_DIM).each do |j|
    #   (0...PIECE_GRID_DIM).each do |i|
    #     tg2[i,j] = tgrid[@gridx+i, @gridy+j]
    #   end 
    # end
    # puts tg2.inspect

    # puts "P:"+@matrix.column_vectors.inspect
    # note: column vectors actually works out to be "row vectors" 
    # due to the way we are storing the grids to begin with
    gvecs=tgrid.column_vectors
    pvecs=@matrix.column_vectors
    # puts "G:"+tgrid.column_vectors.inspect
    c=PIECE_GRID_DIM - 1
    # byebug if at_bottom?
puts "P: " + pvecs.inspect
puts "G: " + gvecs.inspect
    while c >= 0 do
      pvecs[c].each_with_index do |pv,pi|
        if pv == FALLING && gvecs[c][pi] != EMPTY
          return @stopped = true
        end
      end
      c -= 1
    end
  end

  
  def update
    return if !@disposition == FALLING
    if RayKey.is_pressed? RayKey::LEFT
      @gridx -= 1
      @gridx = 0 if @gridx < 0
    elsif RayKey.is_pressed? RayKey::RIGHT
      @gridx += 1
      rlim = GRID_HORIZONTAL_SIZE - PIECE_GRID_DIM
      @gridx = rlim if @gridx > rlim
    elsif RayKey.is_down? RayKey::UP
      @matrix.rotate_x(90)
    elsif RayKey.is_down?( RayKey::DOWN )
      if !at_bottom? && !@stopped 
        @gridy += 1 
      end
    end

    @frames += 1
    if !at_bottom?
      if !@stopped
        @gridy += 1 if @frames % 35 == 0 
      end
    end
  end
end

class LeftL < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 213,41,176,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[0,2]=FALLING
    @matrix[0,3]=FALLING
    @matrix[1,3]=FALLING
    @matrix[2,3]=FALLING
    @matrix[3,3]=FALLING
    @pad_blanks = 0
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
    self.falling.disposition = FALLING
    
    self.incoming = make_new_incoming
    self.incoming.disposition = INCOMING

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
        out[i,j] = matr[piece.gridx+i,piece.gridy+j+1]
      end
    end
    return out
  end
  
  def make_new_incoming
    out = LeftL.new hor_size: PIECE_GRID_DIM, ver_size: PIECE_GRID_DIM
    out.disposition = INCOMING
    out 
  end

  def update
    @grid.update 
    @incoming.update
    if @falling.disposition == FALLING &&
      @falling.stopped?( grid_sub(@grid.matrix, @falling) )
      @grid.freeze_in!(@falling)
      @falling.disposition = FROZEN
      @falling = @incoming
      @falling.disposition = FALLING
      @incoming = make_new_incoming 
    else
      @falling.update
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
        RayDraw.text format('LINES:    %04i', lines), x, y , 10, RayColor::GRAY
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
