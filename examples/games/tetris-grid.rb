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
