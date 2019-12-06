require_relative 'rectangle'
require_relative 'image'

module Raylib
  # Font character info
  class CharInfo
    layout  :value,     :int,               # Character value (Unicode)
            :offset_x,  :int,               # Character offset X when drawing
            :offset_y,  :int,               # Character offset Y when drawing
            :advance_x, :int,               # Character advance position X
            :image,     Image.by_value      # Character image data

    ray_struct_init_accessor :value, :offset_x, :offset_y, :advance_x, :image
  end
end
