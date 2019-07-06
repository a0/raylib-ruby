module Raylib
  class Vector4
    ray_alias_static :QuaternionIdentity,             :identity     # Returns identity quaternion
    ray_alias_object :QuaternionLength,               :length       # Computes the length of a quaternion
    ray_alias_object :QuaternionNormalize,            :normalize    # Normalize provided quaternion
    ray_alias_object :QuaternionInvert,               :invert       # Invert provided quaternion
    ray_alias_object :QuaternionMultiply,             :*            # Calculate two quaternion multiplication
    ray_alias_object :QuaternionLerp,                 :lerp         # Calculate linear interpolation between two quaternions
    ray_alias_object :QuaternionNlerp,                :nlerp        # Calculate slerp-optimized interpolation between two quaternions
    ray_alias_object :QuaternionSlerp,                :slerp        # Calculates spherical linear interpolation between two quaternions
    ray_alias_object :QuaternionToMatrix,             :to_matrix    # Returns a matrix for a given quaternion
    ray_alias_object :QuaternionToAxisAngle,          :axis_angle   # Returns the rotation angle and axis for a given quaternion
    ray_alias_static :QuaternionFromEuler,            :from_euler   # Returns he quaternion equivalent to Euler angles
    # Return the Euler angles equivalent to quaternion (roll, pitch, yaw)
    # NOTE: Angles are returned in a Vector3 struct in degrees
    ray_alias_object :QuaternionToEuler,              :to_euler
    ray_alias_object :QuaternionTransform,            :transform # Transform a quaternion given a transformation matrix

    def to_s
      format "#{self.class.name} [%3.3f, %3.3f, %3.3f, %3.3f]", x, y, z, w
    end
  end
end
