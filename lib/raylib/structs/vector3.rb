module Raylib
  # Vector3 type
  class Vector3
    layout  :x, :float,
            :y, :float,
            :z, :float

    ray_struct_init_accessor :x, :y, :z
  end
end
