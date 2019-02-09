module Raylib
  # Vector4 type
  class Vector4
    layout  :x, :float,
            :y, :float,
            :z, :float,
            :w, :float

    ray_struct_init_accessor :x, :y, :z, :w
  end
end
