module Raylib
  # Texture2D type
  # NOTE: Data stored in GPU memory
  class Texture2D
    layout  :id,      :uint,  # OpenGL texture id
            :width,   :int,   # Texture base width
            :height,  :int,   # Texture base height
            :mipmaps, :int,   # Mipmap levels, 1 by default
            :format,  :int    # Data format (PixelFormat type)

    ray_struct_init_accessor :id, :width, :height, :mipmaps, :format
  end
end
