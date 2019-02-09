module Raylib
  # Matrix type (OpenGL style 4x4 - right handed, column major)
  class Matrix
    layout  :m00, :float, :m04, :float, :m08, :float, :m12, :float,
            :m01, :float, :m05, :float, :m09, :float, :m13, :float,
            :m02, :float, :m06, :float, :m10, :float, :m14, :float,
            :m03, :float, :m07, :float, :m11, :float, :m15, :float

    ray_struct_init_accessor :m00, :m04, :m08, :m12, :m01, :m05, :m09, :m13, :m02, :m06, :m10, :m14, :m03, :m07, :m11, :m15

    def *(other) # rubocop:disable Metrics/AbcSize
      v00 = m00 * other.m00 + m01 * other.m04 + m02 * other.m08 + m03 * other.m12
      v01 = m00 * other.m01 + m01 * other.m05 + m02 * other.m09 + m03 * other.m13
      v02 = m00 * other.m02 + m01 * other.m06 + m02 * other.m10 + m03 * other.m14
      v03 = m00 * other.m03 + m01 * other.m07 + m02 * other.m11 + m03 * other.m15
      v04 = m04 * other.m00 + m05 * other.m04 + m06 * other.m08 + m07 * other.m12
      v05 = m04 * other.m01 + m05 * other.m05 + m06 * other.m09 + m07 * other.m13
      v06 = m04 * other.m02 + m05 * other.m06 + m06 * other.m10 + m07 * other.m14
      v07 = m04 * other.m03 + m05 * other.m07 + m06 * other.m11 + m07 * other.m15
      v08 = m08 * other.m00 + m09 * other.m04 + m10 * other.m08 + m11 * other.m12
      v09 = m08 * other.m01 + m09 * other.m05 + m10 * other.m09 + m11 * other.m13
      v10 = m08 * other.m02 + m09 * other.m06 + m10 * other.m10 + m11 * other.m14
      v11 = m08 * other.m03 + m09 * other.m07 + m10 * other.m11 + m11 * other.m15
      v12 = m12 * other.m00 + m13 * other.m04 + m14 * other.m08 + m15 * other.m12
      v13 = m12 * other.m01 + m13 * other.m05 + m14 * other.m09 + m15 * other.m13
      v14 = m12 * other.m02 + m13 * other.m06 + m14 * other.m10 + m15 * other.m14
      v15 = m12 * other.m03 + m13 * other.m07 + m14 * other.m11 + m15 * other.m15

      Matrix.new v00, v04, v08, v12, v01, v05, v09, v13, v02, v06, v10, v14, v03, v07, v11, v15
    end

    def rotate_x(angle)
      result = Matrix.identity
      cosres = Math.cos angle
      sinres = Math.sin angle

      result.m05 = cosres
      result.m06 = -sinres
      result.m09 = sinres
      result.m10 = cosres

      result
    end

    def rotate_y(angle)
      result = Matrix.identity
      cosres = Math.cos angle
      sinres = Math.sin angle

      result.m00 = cosres
      result.m02 = sinres
      result.m08 = -sinres
      result.m10 = cosres

      result
    end

    def rotate_z(angle)
      result = Matrix.identity
      cosres = Math.cos angle
      sinres = Math.sin angle

      result.m00 = cosres
      result.m01 = -sinres
      result.m04 = sinres
      result.m05 = cosres

      result
    end

    def self.identity
      Matrix.new  1.0, 0.0, 0.0, 0.0,
                  0.0, 1.0, 0.0, 0.0,
                  0.0, 0.0, 1.0, 0.0,
                  0.0, 0.0, 0.0, 1.0
    end
  end
end
