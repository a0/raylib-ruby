module Raylib
  class Collision
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Basic Shapes Drawing Functions (Module: shapes)
    #------------------------------------------------------------------------------------

    # Basic shapes collision detection functions
    ray_static :CheckCollisionRecs,           :check_recs,            [Rectangle.by_value, Rectangle.by_value], :bool                                   # Check collision between two rectangles
    ray_static :CheckCollisionCircles,        :check_circles,         [Vector2.by_value, :float, Vector2.by_value, :float], :bool                       # Check collision between two circles
    ray_static :CheckCollisionCircleRec,      :check_circle_rec,      [Vector2.by_value, :float, Rectangle.by_value], :bool                             # Check collision between circle and rectangle
    ray_static :GetCollisionRec,              :rec,                   [Rectangle.by_value, Rectangle.by_value], Rectangle.by_value                      # Get collision rectangle for two rectangles collision
    ray_static :CheckCollisionPointRec,       :check_point_rec,       [Vector2.by_value, Rectangle.by_value], :bool                                     # Check if point is inside rectangle
    ray_static :CheckCollisionPointCircle,    :check_point_circle,    [Vector2.by_value, Vector2.by_value, :float], :bool                               # Check if point is inside circle
    ray_static :CheckCollisionPointTriangle,  :check_point_triangle,  [Vector2.by_value, Vector2.by_value, Vector2.by_value, Vector2.by_value], :bool   # Check if point is inside a triangle

    # Collision detection functions
    ray_alias_static :CheckCollisionSpheres,        :check_spheres        # Detect collision between two spheres
    ray_alias_static :CheckCollisionBoxes,          :check_boxes          # Detect collision between two bounding boxes
    ray_alias_static :CheckCollisionBoxSphere,      :check_box_sphere     # Detect collision between box and sphere
    ray_alias_static :CheckCollisionRaySphere,      :check_ray_sphere     # Detect collision between ray and sphere
    ray_alias_static :CheckCollisionRaySphereEx,    :check_ray_sphere_ex  # Detect collision between ray and sphere, returns collision point
    ray_alias_static :CheckCollisionRayBox,         :check_ray_box        # Detect collision between ray and box
    ray_alias_static :GetCollisionRayModel,         :check_ray_model      # Get collision info between ray and model
    ray_alias_static :GetCollisionRayTriangle,      :check_ray_triangle   # Get collision info between ray and triangle
    ray_alias_static :GetCollisionRayGround,        :check_ray_ground     # Get collision info between ray and ground plane (Y-normal plane)
  end
end
