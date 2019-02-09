require_relative 'vector3'

module Raylib
  # Raycast hit information
  class RayHitInfo
    layout  :hit,       :bool,              # Did the ray hit something?
            :distance,  :float,             # Distance to nearest hit
            :position,  Vector3.by_value,   # Position of nearest hit
            :normal,    Vector3.by_value    # Surface normal of hit

    ray_struct_init_accessor :hit, :distance, :position, :normal
  end
end
