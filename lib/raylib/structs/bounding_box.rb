require_relative 'vector3'

module Raylib
  # Bounding box type
  class BoundingBox
    layout  :min, Vector3.by_value, # Minimum vertex box-corner
            :max, Vector3.by_value  # Maximum vertex box-corner

    ray_struct_init_accessor :min, :max
  end
end
