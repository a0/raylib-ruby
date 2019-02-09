module Raylib
  # Color type, RGBA (32bit)
  class Color
    layout  :r,   :uchar,
            :g,   :uchar,
            :b,   :uchar,
            :a,   :uchar

    ray_struct_init_accessor :r, :g, :b, :a
  end
end
