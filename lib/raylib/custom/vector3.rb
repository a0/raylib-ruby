module Raylib
  class Vector3
    ray_alias_static :Vector3Zero,                :zero               # Vector with components value 0.0f
    ray_alias_static :Vector3One,                 :one                # Vector with components value 1.0f
    ray_alias_object :Vector3Add,                 :+                  # Add two vectors
    ray_alias_object :Vector3Subtract,            :-                  # Subtract two vectors
    ray_alias_object :Vector3Multiply,            :multiply           # Multiply vector by scalar
    ray_alias_object :Vector3MultiplyV,           :*                  # Multiply vector by vector
    ray_alias_object :Vector3CrossProduct,        :cross_product      # Calculate two vectors cross product
    ray_alias_object :Vector3Perpendicular,       :perpendicular      # Calculate one vector perpendicular vector
    ray_alias_object :Vector3Length,              :length             # Calculate vector length
    ray_alias_object :Vector3DotProduct,          :dot_product        # Calculate two vectors dot product
    ray_alias_object :Vector3Distance,            :distance           # Calculate distance between two vectors
    ray_alias_object :Vector3Scale,               :scale              # Scale provided vector
    ray_alias_object :Vector3Negate,              :negate             # Negate provided vector (invert direction)
    ray_alias_object :Vector3Divide,              :divide             # Divide vector by a float value
    ray_alias_object :Vector3DivideV,             :/                  # Divide vector by vector
    ray_alias_object :Vector3Normalize,           :normalize          # Normalize provided vector
    # Orthonormalize provided vectors
    # Makes vectors normalized and orthogonal to each other
    # Gram-Schmidt function implementation
    ray_alias_object :Vector3OrthoNormalize,      :ortho_normalize
    ray_alias_object :Vector3Transform,           :transform          # Transforms a Vector3 by a given Matrix
    ray_alias_object :Vector3RotateByQuaternion,  :rotate_by          # Transform a vector by quaternion rotation
    ray_alias_object :Vector3Lerp,                :lerp               # Calculate linear interpolation between two vectors
    ray_alias_object :Vector3Reflect,             :reflect            # Calculate reflected vector to normal
    ray_alias_object :Vector3Min,                 :min                # Return min value for each pair of components
    ray_alias_object :Vector3Max,                 :max                # Return max value for each pair of components
    # Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
    # NOTE: Assumes P is on the plane of the triangle
    ray_alias_object :Vector3Barycenter,          :barycenter
    # Returns Vector3 as float array
    ray_alias_object :Vector3ToFloatV,            :to_float3

    # Calculate quaternion based on the rotation from one vector to another
    ray_alias_static :QuaternionFromVector3ToVector3, :to_quaternion_vector3
    # Returns rotation quaternion for an angle and axis
    # NOTE: angle must be provided in radians
    ray_alias_object :QuaternionFromAxisAngle,        :to_quaternion_angle

    def to_s
      format "#{self.class.name} [%3.3f, %3.3f, %3.3f]", x, y, z
    end
  end
end
