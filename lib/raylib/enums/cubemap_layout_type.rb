module Raylib
  # Cubemap layout type
  CubemapLayoutType = enum(
    :auto_detect, 0,        # Automatically detect layout type
    :line_vertical,         # Layout is defined by a vertical line with faces
    :line_horizontal,       # Layout is defined by an horizontal line with faces
    :cross_three_by_four,   # Layout is defined by a 3x4 cross with cubemap faces
    :cross_four_by_three,   # Layout is defined by a 4x3 cross with cubemap faces
    :panorama               # Layout is defined by a panorama image (equirectangular map)
  )
end
