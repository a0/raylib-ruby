require_relative 'vector3'
require_relative 'vector4'

module Raylib
  # Transformation properties
  class Transform
    layout  :translation, Vector3.by_value,   # Translation
            :rotation, Quaternion.by_value,   # Rotation
            :scale, Vector3.by_value          # Scale
  end
end
