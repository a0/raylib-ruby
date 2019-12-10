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

Grid = Struct.new :hor_size, :ver_size, :gmtr, keyword_init: true do
  attr_accessor :matrix
  attr_reader :gmtr

  def initialize(*args)
    super
    @gmtr = args.first[:gmtr]
    @matrix = Matrix.build(hor_size, ver_size) { 0 }
  end

  def update; end

  def freeze_in!(piece)
    return unless piece.disposition == FALLING && piece.stopped?

    (0...PIECE_GRID_DIM).each do |j|
      (0...PIECE_GRID_DIM).each do |i|
        if @matrix[i + piece.gridx, j + piece.gridy] == EMPTY && piece.matrix[i, j] == FALLING
          @matrix[i + piece.gridx, j + piece.gridy] = piece.falling_color
        end
      end
    end

    piece.disposition = FROZEN
    piece
  end

  def draw(x, y)
    controller = x
    (0...ver_size).each do |j|
      (0...hor_size).each do |i|
        if matrix[i, j] == EMPTY || matrix[i, j] == FALLING
          RayDraw.line x, y, x + SQUARE_SIZE, y, :lightgray
          RayDraw.line x, y, x, y + SQUARE_SIZE, :lightgray
          RayDraw.line x + SQUARE_SIZE, y, x + SQUARE_SIZE, y + SQUARE_SIZE, :lightgray
          RayDraw.line x, y + SQUARE_SIZE, x + SQUARE_SIZE, y + SQUARE_SIZE, :lightgray
          x += SQUARE_SIZE
        elsif matrix[i, j] == :full
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, :gray
          x += SQUARE_SIZE
        elsif matrix[i, j] == :moving
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, :darkgray
          x += SQUARE_SIZE
        elsif matrix[i, j] == :block
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, :lightgray
          x += SQUARE_SIZE
        elsif matrix[i, j] == :fading
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, fading_color
          x += SQUARE_SIZE
        elsif matrix[i, j].is_a?(RayColor)
          RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, matrix[i, j]
          x += SQUARE_SIZE
        elsif matrix[i, j] == FALLING
          x += SQUARE_SIZE
        end
      end

      x = controller
      y += SQUARE_SIZE
    end

    [x, y]
  end
end
