module Raylib
  # Texture parameters: wrap mode
  TextureWrapMode = enum(
    :repeat, 0,       # Repeats texture in tiled mode
    :clamp,           # Clamps texture to edge pixel in tiled mode
    :mirror_repeat,   # Mirrors and repeats the texture in tiled mode
    :mirror_clamp     # Mirrors and clamps to border the texture in tiled mode
  )
end
