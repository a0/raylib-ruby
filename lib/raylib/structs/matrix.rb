module Raylib
  # Matrix type (OpenGL style 4x4 - right handed, column major)
  class Matrix
    layout  :m00, :float, :m04, :float, :m08, :float, :m12, :float,
            :m01, :float, :m05, :float, :m09, :float, :m13, :float,
            :m02, :float, :m06, :float, :m10, :float, :m14, :float,
            :m03, :float, :m07, :float, :m11, :float, :m15, :float

    ray_struct_init_accessor :m00, :m04, :m08, :m12, :m01, :m05, :m09, :m13, :m02, :m06, :m10, :m14, :m03, :m07, :m11, :m15
  end
end
