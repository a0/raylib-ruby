require_relative 'rectangle'

module Raylib
  # Font character info
  class CharInfo
    layout  :value,     :int,               # Character value (Unicode)
            :rec,       Rectangle.by_value, # Character rectangle in sprite font
            :offset_x,  :int,               # Character offset X when drawing
            :offset_y,  :int,               # Character offset Y when drawing
            :advance_x, :int,               # Character advance position X
            :data,      :pointer            # Character pixel data (grayscale)

    ray_struct_accessor :value, :rec, :offset_x, :offset_y, :advance_x, :data
  end
end
