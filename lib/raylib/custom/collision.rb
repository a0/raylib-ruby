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

    #------------------------------------------------------------------------------------
    # Model 3d Loading and Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Collision detection functions
    ray_static :CheckCollisionSpheres,        :check_spheres,         [Vector3.by_value, :float, Vector3.by_value, :float], :bool                                 # Detect collision between two spheres
    ray_static :CheckCollisionBoxes,          :check_boxes,           [BoundingBox.by_value, BoundingBox.by_value], :bool                                         # Detect collision between two bounding boxes
    ray_static :CheckCollisionBoxSphere,      :check_box_sphere,      [BoundingBox.by_value, Vector3.by_value, :float], :bool                                     # Detect collision between box and sphere
    ray_static :CheckCollisionRaySphere,      :check_ray_sphere,      [Ray.by_value, Vector3.by_value, :float], :bool                                             # Detect collision between ray and sphere
    ray_static :CheckCollisionRaySphereEx,    :check_ray_sphere_ex,   [Ray.by_value, Vector3.by_value, :float, :pointer], :bool                                   # Detect collision between ray and sphere, returns collision point
    ray_static :CheckCollisionRayBox,         :check_ray_box,         [Ray.by_value, BoundingBox.by_value], :bool                                                 # Detect collision between ray and box
    ray_static :GetCollisionRayModel,         :check_ray_model,       [Ray.by_value, Model.by_value], RayHitInfo.by_value                                         # Get collision info between ray and model
    ray_static :GetCollisionRayTriangle,      :check_ray_triangle,    [Ray.by_value, Vector3.by_value, Vector3.by_value, Vector3.by_value], RayHitInfo.by_value   # Get collision info between ray and triangle
    ray_static :GetCollisionRayGround,        :check_ray_ground,      [Ray.by_value, :float], RayHitInfo.by_value                                                 # Get collision info between ray and ground plane (Y-normal plane)
  end
end
