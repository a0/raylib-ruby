module Raylib
  # Model animation
  class ModelAnimation
    layout  :bone_count, :int,      # Number of bones
            :bone_info, :bones,     # Bones information (skeleton)
            :frame_count, :int,     # Number of animation frames
            :frame_poses, :pointer  # Poses array by frame

    ray_struct_accessor :bone_count, :bone_info, :frame_count, :frame_poses
  end
end
