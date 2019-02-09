require_relative 'vector3'

module Raylib
  # Camera type, defines a camera position/orientation in 3d space
  class Camera3D
    layout  :position,  Vector3.by_value, # Camera position
            :target,    Vector3.by_value, # Camera target it looks-at
            :up,        Vector3.by_value, # Camera up vector (rotation over its axis)
            :fovy,      :float,           # Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
            :type,      :int              # Camera type, defines projection type: TYPE_PERSPECTIVE or TYPE_ORTHOGRAPHIC

    ray_struct_init_accessor :position, :target, :up, :fovy, :type
  end
end
