module Raylib
  # Image type, bpp always RGBA (32bit)
  # NOTE: Data stored in CPU memory (RAM)
  class Image
    layout  :data,    :pointer,   # Image raw data
            :width,   :int,       # Image base widt
            :height,  :int,       # Image base heigh
            :mipmaps, :int,       # Mipmap levels, 1 by defaul
            :format,  :int        # Data format (PixelFormat type

    ray_struct_accessor :data, :width, :height, :mipmaps, :format
  end
end
