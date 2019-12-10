module Raylib
  class Ray
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Basic 3d Shapes Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Basic geometric 3D shapes drawing functions
    ray_object :DrawRay, :draw, [Ray.by_value, Color.by_value], :void # Draw a ray line
  end
end
