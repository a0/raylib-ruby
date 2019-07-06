module Raylib
  # Helper types to be used instead of array return types for *ToFloat functions
  class Float3
    layout :v, [:float, 3]

    ray_struct_init_accessor :v
  end
end
