module Raylib
  class Image
    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadImage,              :load               # Load image from file into CPU memory (RAM)
    ray_alias_static :LoadImageEx,            :load_ex            # Load image from Color array data (RGBA - 32bit)
    ray_alias_static :LoadImagePro,           :load_pro           # Load image from raw data with parameters
    ray_alias_static :LoadImageRaw,           :load_raw           # Load image from RAW file data
    ray_alias_object :ExportImage,            :export             # Export image as a PNG file
    ray_alias_object :LoadTextureFromImage,   :to_texture2d       # Load texture from image data
    ray_alias_object :UnloadImage,            :unload             # Unload image from CPU memory (RAM)
    ray_alias_object :GetImageData,           :to_data            # Get pixel data from image as a Color struct array
    ray_alias_object :GetImageDataNormalized, :to_data_normalized # Get pixel data from image as Vector4 array (float normalized)
    ray_alias_static :GetPixelDataSize,       :pixel_data_size    # Get pixel data size in bytes (image or texture)

    # Image manipulation functions
    ray_alias_object :ImageCopy,              :copy               # Create an image duplicate (useful for transformations)
    ray_alias_object :ImageToPOT,             :pot!               # Convert image to POT (power-of-two)
    ray_alias_object :ImageFormat,            :format!            # Convert image data to desired format
    ray_alias_object :ImageAlphaMask,         :alpha_mask!        # Apply alpha mask to image
    ray_alias_object :ImageAlphaClear,        :alpha_clear!       # Clear alpha channel to desired color
    ray_alias_object :ImageAlphaCrop,         :alpha_crop!        # Crop image depending on alpha value
    ray_alias_object :ImageAlphaPremultiply,  :alpha_premultiply! # Premultiply alpha channel
    ray_alias_object :ImageCrop,              :crop!              # Crop an image to a defined rectangle
    ray_alias_object :ImageResize,            :resize!            # Resize image (bilinear filtering)
    ray_alias_object :ImageResizeNN,          :resize_nn!         # Resize image (Nearest-Neighbor scaling algorithm)
    ray_alias_object :ImageResizeCanvas,      :resize_canvas!     # Resize canvas and fill with color
    ray_alias_object :ImageMipmaps,           :gen_mipmaps!       # Generate all mipmap levels for a provided image
    ray_alias_object :ImageDither,            :dither!            # Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    ray_alias_static :ImageText,              :from_text          # Create an image from text (default font)
    ray_alias_static :ImageTextEx,            :from_text_ex       # Create an image from text (custom sprite font)
    ray_alias_object :ImageDraw,              :draw!              # Draw a source image within a destination image
    ray_alias_object :ImageDrawRectangle,     :draw_rectangle!    # Draw rectangle within an image
    ray_alias_object :ImageDrawText,          :draw_text!         # Draw text (default font) within an image (destination)
    ray_alias_object :ImageDrawTextEx,        :draw_text_ex!      # Draw text (custom sprite font) within an image (destination)
    ray_alias_object :ImageFlipVertical,      :flip_vertical!     # Flip image vertically
    ray_alias_object :ImageFlipHorizontal,    :flip_horizontal!   # Flip image horizontally
    ray_alias_object :ImageRotateCW,          :rotate_cw!         # Rotate image clockwise 90deg
    ray_alias_object :ImageRotateCCW,         :rotate_ccw!        # Rotate image counter-clockwise 90deg
    ray_alias_object :ImageColorTint,         :color_tint!        # Modify image color: tint
    ray_alias_object :ImageColorInvert,       :color_invert!      # Modify image color: invert
    ray_alias_object :ImageColorGrayscale,    :color_grayscale!   # Modify image color: grayscale
    ray_alias_object :ImageColorContrast,     :color_contrast!    # Modify image color: contrast (-100 to 100)
    ray_alias_object :ImageColorBrightness,   :color_brightness!  # Modify image color: brightness (-255 to 255)
    ray_alias_object :ImageColorReplace,      :color_replace!     # Modify image color: replace color

    # Image generation functions
    ray_alias_static :GenImageColor,          :gen_color            # Generate image: plain color
    ray_alias_static :GenImageGradientV,      :gen_gradient_v       # Generate image: vertical gradient
    ray_alias_static :GenImageGradientH,      :gen_gradient_h       # Generate image: horizontal gradient
    ray_alias_static :GenImageGradientRadial, :gen_gradient_radial  # Generate image: radial gradient
    ray_alias_static :GenImageChecked,        :gen_checked          # Generate image: checked
    ray_alias_static :GenImageWhiteNoise,     :gen_white_noise      # Generate image: white noise
    ray_alias_static :GenImagePerlinNoise,    :gen_perlin_noise     # Generate image: perlin noise
    ray_alias_static :GenImageCellular,       :gen_cellular         # Generate image: cellular algorithm. Bigger tileSize means bigger cells
  end
end
