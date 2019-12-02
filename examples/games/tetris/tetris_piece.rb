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

class Piece < Grid
  attr_accessor :falling_color, :disposition, :gridy
  attr_reader :gridx, :stopped

  def initialize(*args)
    super

    @matrix = Matrix.build(hor_size, ver_size) { INCOMING }
    @frames = 0
    @gridx = GRID_HORIZONTAL_SIZE / 2 - 2
    @gridy = 0
  end

  def draw(x, y)
    @x = 230 + @gridx * SQUARE_SIZE
    @y = 25 + @gridy * SQUARE_SIZE

    drawx = x || @x
    drawy = y || @y
    x = drawx
    y = drawy
    if @disposition == FALLING || @disposition == INCOMING
      (0...PIECE_GRID_DIM).each do |j|
        (0...PIECE_GRID_DIM).each do |i|
          if matrix[i, j] == EMPTY
            if stopped?
              RayDraw.line x, y, x + SQUARE_SIZE, y, RayColor::GOLD
              RayDraw.line x, y, x, y + SQUARE_SIZE, RayColor::GOLD
              RayDraw.line x + SQUARE_SIZE, y, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::GOLD
              RayDraw.line x, y + SQUARE_SIZE, x + SQUARE_SIZE, y + SQUARE_SIZE, RayColor::GOLD
            end
          else
            RayDraw.rectangle x, y, SQUARE_SIZE, SQUARE_SIZE, falling_color
          end
          x += SQUARE_SIZE
        end
        x = drawx
        y += SQUARE_SIZE
      end
      oux = @x
      ouy = @y
    else
      oux, ouy = super drawx, drawy
    end

    [oux, ouy]
  end

  def get_padding
    mtrx = @matrix
    tp = bp = lp = rp = 0
    tpdone = false # bpdone = false
    lpdone = false # rpdone = false
    ary = [0, 1, 2, 3]
    (0...PIECE_GRID_DIM).each do |v|
      if tpdone == false
        if ary.all? { |h| mtrx[h, v] == EMPTY }
          tp += 1
        else
          tpdone = true
        end
      else
        if ary.all? { |h| mtrx[h, v] == EMPTY }
          bp = PIECE_GRID_DIM - v
          break
        end
      end
    end
    (0...PIECE_GRID_DIM).each do |h|
      if lpdone == false
        if ary.all? { |v| mtrx[h, v] == EMPTY }
          lp += 1
        else
          lpdone = true
        end
      else
        if ary.all? { |v| mtrx[h, v] == EMPTY }
          rp = PIECE_GRID_DIM - h
          break
        end
      end
    end

    [@top_pad = tp, @bottom_pad = bp, @left_pad = lp, @right_pad = rp]
  end

  def rotate!(_dir = :left)
    return @matrix unless disposition == FALLING

    nmatrix = Matrix.build(PIECE_GRID_DIM, PIECE_GRID_DIM) { EMPTY }

    (0...PIECE_GRID_DIM).each do |v|
      (0...PIECE_GRID_DIM).each do |h|
        nmatrix[h, v] = @matrix[v, PIECE_GRID_DIM - h - 1]
      end
    end

    @matrix = nmatrix
    get_padding
    @matrix
  end

  def at_bottom?
    @gridy - @bottom_pad + PIECE_GRID_DIM >= GRID_VERTICAL_SIZE
  end

  def grid_sub
    # return an array of 4 horizontal arrays
    # that are a chunk of the game grid, starting at
    # the piece's gridx,gridy coordinates
    out = Matrix.build(PIECE_GRID_DIM, PIECE_GRID_DIM) { 0 }
    (0...PIECE_GRID_DIM).each do |j|
      (0...PIECE_GRID_DIM).each do |i|
        # @gridx..@gridx + PIECE_GRID_DIM
        out[i, j] = @gmtr[@gridx + i, @gridy + j + 1]
      end
    end

    out
  end

  def stopped?
    tgrid = grid_sub
    return true if at_bottom?

    gvecs = tgrid.column_vectors
    pvecs = @matrix.column_vectors
    c = PIECE_GRID_DIM - 1
    while c >= 0
      pvecs[c].each_with_index do |pv, pi|
        return true if pv == FALLING && gvecs[c][pi] != EMPTY
      end
      c -= 1
    end
  end

  def can_left?
    return false if @gridx + @left_pad < 1

    lefti = @gridx - 1 + @left_pad
    (0...PIECE_GRID_DIM).each do |vi|
      return false if @matrix[@left_pad, vi] == FALLING && @gmtr[lefti, @gridy + vi] != EMPTY
    end

    true
  end

  def can_right?
    return false if GRID_HORIZONTAL_SIZE < (1 + @gridx + PIECE_GRID_DIM - @right_pad)

    righti = @gridx + PIECE_GRID_DIM - @right_pad
    (0...PIECE_GRID_DIM).each do |vi|
      return false if @matrix[PIECE_GRID_DIM - @right_pad - 1, vi] == FALLING && @gmtr[righti, @gridy + vi] != EMPTY
    end
    true
  end

  def update(game_grid_matrix)
    return if !@disposition == FALLING

    @gmtr = game_grid_matrix
    down_pressed = false
    if RayKey.is_pressed? RayKey::LEFT
      @gridx -= 1 if can_left?
    elsif RayKey.is_pressed? RayKey::RIGHT
      @gridx += 1 if can_right?
    elsif RayKey.is_pressed? RayKey::UP
      @matrix = rotate!(90)
    elsif RayKey.is_down? RayKey::DOWN
      down_pressed = true
    end

    @frames += 1
    return if at_bottom? || stopped?

    if down_pressed
      @gridy += 1
    elsif @frames % 35 == 0
      @gridy += 1
    end
  end
end
