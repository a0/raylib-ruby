module Raylib
  class Vector2
    ray_alias_static :Vector2Zero,        :zero         # Vector with components value 0.0f
    ray_alias_static :Vector2One,         :one          # Vector with components value 1.0f
    ray_alias_object :Vector2Add,         :+            # Add two vectors (v1 + v2)
    ray_alias_object :Vector2Subtract,    :-            # Subtract two vectors (v1 - v2)
    ray_alias_object :Vector2Length,      :length       # Calculate vector length
    ray_alias_object :Vector2DotProduct,  :dot_product  # Calculate two vectors dot product
    ray_alias_object :Vector2Distance,    :distance     # Calculate distance between two vectors
    ray_alias_object :Vector2Angle,       :angle        # Calculate angle from two vectors in X-axis
    ray_alias_object :Vector2Scale,       :scale        # Scale vector (multiply by value)
    ray_alias_object :Vector2MultiplyV,   :*            # Multiply vector by vector
    ray_alias_object :Vector2Negate,      :negate       # Negate vector
    ray_alias_object :Vector2Divide,      :divide       # Divide vector by a float value
    ray_alias_object :Vector2DivideV,     :/            # Divide vector by vector
    ray_alias_object :Vector2Normalize,   :normalize    # Normalize provided vector
    ray_alias_object :Vector2Lerp,        :lerp         # Calculate linear interpolation between two vectors

    def to_s
      format "#{self.class.name} [%3.3f, %3.3f]", x, y
    end
  end
end
