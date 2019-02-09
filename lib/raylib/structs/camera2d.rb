require_relative 'vector2'

module Raylib
  # Camera2D type, defines a 2d camera
  class Camera2D
    layout  :offset,    Vector2.by_value, # Camera offset (displacement from target)
            :target,    Vector2.by_value, # Camera target (rotation and zoom origin)
            :rotation,  :float,           # Camera rotation in degrees
            :zoom,      :float            # Camera zoom (scaling), should be 1.0f by default

    ray_struct_init_accessor :offset, :target, :rotation, :zoom
  end
end
