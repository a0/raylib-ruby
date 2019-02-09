require_relative 'vector3'

module Raylib
  # Ray type (useful for raycast)
  class Ray
    layout  :position,  Vector3.by_value,   # Ray position (origin)
            :direction, Vector3.by_value    # Ray direction

    ray_struct_init_accessor :position, :direction
  end
end
