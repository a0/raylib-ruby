module Raylib
  # Pixel formats
  # NOTE: Support depends on OpenGL version and platform
  PixelFormat = enum(
    :uncompressed_grayscale, 1,   # 8 bit per pixel (no alpha)
    :uncompressed_gray_alpha,     # 8*2 bpp (2 channels)
    :uncompressed_r5g6b5,         # 16 bpp
    :uncompressed_r8g8b8,         # 24 bpp
    :uncompressed_r5g5b5a1,       # 16 bpp (1 bit alpha)
    :uncompressed_r4g4b4a4,       # 16 bpp (4 bit alpha)
    :uncompressed_r8g8b8a8,       # 32 bpp
    :uncompressed_r32,            # 32 bpp (1 channel - float)
    :uncompressed_r32g32b32,      # 32*3 bpp (3 channels - float)
    :uncompressed_r32g32b32a32,   # 32*4 bpp (4 channels - float)
    :compressed_dxt1_rgb,         # 4 bpp (no alpha)
    :compressed_dxt1_rgba,        # 4 bpp (1 bit alpha)
    :compressed_dxt3_rgba,        # 8 bpp
    :compressed_dxt5_rgba,        # 8 bpp
    :compressed_etc1_rgb,         # 4 bpp
    :compressed_etc2_rgb,         # 4 bpp
    :compressed_etc2_eac_rgba,    # 8 bpp
    :compressed_pvrt_rgb,         # 4 bpp
    :compressed_pvrt_rgba,        # 4 bpp
    :compressed_astc_4x4_rgba,    # 8 bpp
    :compressed_astc_8x8_rgba     # 2 bpp
  )
end
