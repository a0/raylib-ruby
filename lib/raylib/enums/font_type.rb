module Raylib
  # Font type, defines generation method
  FontType = enum(
    :default, 0,    # Default font generation, anti-aliased
    :bitmap,        # Bitmap font generation, no anti-aliasing
    :sdf            # SDF font generation, requires external shader
  )
end
