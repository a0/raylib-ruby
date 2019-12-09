module Raylib
  class BoundingBox
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Model 3d Loading and Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Model drawing functions
    ray_object :DrawBoundingBox, :draw, [BoundingBox.by_value, Color.by_value], :void # Draw bounding box (wires)
  end
end
