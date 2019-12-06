module Raylib
  # Type of n-patch
  NPatchType = enum(
    :npt_9patch, 0,           # Npatch defined by 3x3 tiles
    :npt_3patch_vertical,     # Npatch defined by 1x3 tiles
    :npt_3patch_horizontal    # Npatch defined by 3x1 tiles
  )
end
