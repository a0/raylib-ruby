module Raylib
  # Color blending modes (pre-defined)
  BlendMode = enum(
    :alpha, 0,    # Blend textures considering alpha (default)
    :additive,    # Blend textures adding colors
    :multiplied   # Blend textures multiplying colors
  )
end
