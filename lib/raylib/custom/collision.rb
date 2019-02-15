module Raylib
  class Collision
    # Basic shapes collision detection functions
    ray_alias_static :CheckCollisionRecs,           :check_recs           # Check collision between two rectangles
    ray_alias_static :CheckCollisionCircles,        :check_circles        # Check collision between two circles
    ray_alias_static :CheckCollisionCircleRec,      :check_circle_rec     # Check collision between circle and rectangle
    ray_alias_static :GetCollisionRec,              :rec                  # Get collision rectangle for two rectangles collision
    ray_alias_static :CheckCollisionPointRec,       :check_point_rec      # Check if point is inside rectangle
    ray_alias_static :CheckCollisionPointCircle,    :check_point_circle   # Check if point is inside circle
    ray_alias_static :CheckCollisionPointTriangle,  :check_point_triangle # Check if point is inside a triangle

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
