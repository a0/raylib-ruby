module Raylib
  # Rectangle type
  class Rectangle
    layout  :x,       :float,
            :y,       :float,
            :width,   :float,
            :height,  :float

    ray_struct_init_accessor :x, :y, :width, :height
  end
end
