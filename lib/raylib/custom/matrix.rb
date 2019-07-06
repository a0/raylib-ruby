module Raylib
  class Matrix
    ray_alias_object :MatrixDeterminant,    :determinant    # Compute matrix determinant
    ray_alias_object :MatrixTrace,          :trace          # Returns the trace of the matrix (sum of the values along the diagonal)
    ray_alias_object :MatrixTranspose,      :transpose      # Transposes provided matrix
    ray_alias_object :MatrixInvert,         :invert         # Invert provided matrix
    ray_alias_object :MatrixNormalize,      :normalize      # Normalize provided matrix
    ray_alias_static :MatrixIdentity,       :identity       # Returns identity matrix
    ray_alias_object :MatrixAdd,            :+              # Add two matrices
    ray_alias_object :MatrixSubtract,       :-              # Subtract two matrices (left - right)
    ray_alias_static :MatrixTranslate,      :translate      # Returns translation matrix
    ray_alias_static :MatrixRotate,         :rotate         # Create rotation matrix from axis and angle NOTE: Angle should be provided in radians
    ray_alias_static :MatrixRotateX,        :rotate_x       # Returns x-rotation matrix (angle in radians)
    ray_alias_static :MatrixRotateY,        :rotate_y       # Returns y-rotation matrix (angle in radians)
    ray_alias_static :MatrixRotateZ,        :rotate_z       # Returns z-rotation matrix (angle in radians)
    ray_alias_static :MatrixScale,          :scale          # Returns scaling matrix
    ray_alias_object :MatrixMultiply,       :*              # Returns two matrix multiplication NOTE: When multiplying matrices... the order matters!
    ray_alias_static :MatrixFrustum,        :frustrum       # Returns perspective projection matrix
    ray_alias_static :MatrixPerspective,    :perspective    # Returns perspective projection matrix NOTE: Angle should be provided in radians
    ray_alias_static :MatrixOrtho,          :ortho          # Returns orthographic projection matrix
    ray_alias_static :MatrixLookAt,         :look_at        # Returns camera look-at matrix (view matrix)
    ray_alias_object :MatrixToFloat,        :to_float16     # Returns float array of matrix data

    ray_alias_object :QuaternionFromMatrix, :to_quaternion  # Returns a quaternion for a given rotation matrix

    def to_s
      format_str = <<~FIN
        #{self.class.name}
        %3.3f %3.3f %3.3f %3.3f
        %3.3f %3.3f %3.3f %3.3f
        %3.3f %3.3f %3.3f %3.3f
        %3.3f %3.3f %3.3f %3.3f
      FIN

      format format_str, m00, m04, m08, m12, m01, m05, m09, m13, m02, m06, m10, m14, m03, m07, m11, m15
    end
  end
end
