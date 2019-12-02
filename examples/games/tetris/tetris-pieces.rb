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

class LeftL < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 213,41,176,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[0,1]=FALLING
    @matrix[0,2]=FALLING
    @matrix[1,2]=FALLING
    @matrix[2,2]=FALLING
    get_padding
    @gridy = -@top_pad
  end
end

class RightL < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 225,225,25,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[2,1]=FALLING
    @matrix[0,2]=FALLING
    @matrix[1,2]=FALLING
    @matrix[2,2]=FALLING
    get_padding
    @gridy = -@top_pad
  end
end

class Cube < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 204,115,88,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[1,1]=FALLING
    @matrix[1,2]=FALLING
    @matrix[2,1]=FALLING
    @matrix[2,2]=FALLING
    get_padding
    @gridy = -@top_pad
  end
end

class Bar < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 114,188,202,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[0,1]=FALLING
    @matrix[1,1]=FALLING
    @matrix[2,1]=FALLING
    @matrix[3,1]=FALLING
    get_padding
    @gridy = -@top_pad
  end
end

class Sniggle < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 186,154,214,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[0,1]=FALLING
    @matrix[1,1]=FALLING
    @matrix[1,2]=FALLING
    @matrix[2,2]=FALLING
    get_padding
    @gridy = -@top_pad
  end
end

class Piggle < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 146,224,94,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[1,1]=FALLING
    @matrix[2,1]=FALLING
    @matrix[0,2]=FALLING
    @matrix[1,2]=FALLING
    get_padding
    @gridy = -@top_pad
  end
end

class Nipple < Piece 
  def initialize(*args)
    super
    @falling_color = RayColor.new 120,95,110,255
    @matrix = Matrix.build(hor_size, ver_size) { EMPTY }
    @matrix[0,2]=FALLING
    @matrix[1,2]=FALLING
    @matrix[2,2]=FALLING
    @matrix[1,1]=FALLING
    get_padding
    @gridy = -@top_pad
  end
end
