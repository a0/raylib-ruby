module Raylib
  # Texture parameters: filter mode
  # NOTE 1: Filtering considers mipmaps if available in the texture
  # NOTE 2: Filter is accordingly set for minification and magnification
  TextureFilterMode = enum(
    :point,             # No filter, just pixel aproximation
    :bilinear,          # Linear filtering
    :trilinear,         # Trilinear filtering (linear with mipmaps)
    :anisotropic_4x,    # Anisotropic filtering 4x
    :anisotropic_8x,    # Anisotropic filtering 8x
    :anisotropic_16x    # Anisotropic filtering 16x
  )
end
