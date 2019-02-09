require_relative 'texture2d'

module Raylib
  # Font type, includes texture and charSet array data
  class Font
    layout  :texture,     Texture2D.by_value, # Font texture
            :base_size,   :int,               # Base size (default chars height)
            :chars_count, :int,               # Number of characters
            :chars,       :pointer            # Characters info data

    ray_struct_accessor :texture, :base_size, :chars_count, :chars
  end
end
