module Raylib
  # Vector2 type
  class Vector2
    layout  :x, :float,
            :y, :float

    ray_struct_init_accessor :x, :y
  end
end
