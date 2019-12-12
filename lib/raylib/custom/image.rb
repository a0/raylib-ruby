module Raylib
  class Image
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Texture Loading and Drawing Functions (Module: textures)
    #------------------------------------------------------------------------------------

    # Image/Texture2D data loading/unloading/saving functions
    ray_static :LoadImage,                :load,                  %i[string], Image.by_value                                                                      # Load image from file into CPU memory (RAM)
    ray_static :LoadImageEx,              :load_ex,               %i[pointer int int], Image.by_value                                                             # Load image from Color array data (RGBA - 32bit)
    ray_static :LoadImagePro,             :load_pro,              %i[pointer int int int], Image.by_value                                                         # Load image from raw data with parameters
    ray_static :LoadImageRaw,             :load_raw,              [:string, :int, :int, PixelFormat, :int], Image.by_value                                        # Load image from RAW file data
    ray_object :ExportImage,              :export,                [Image.by_value, :string], :void                                                                # Export image data to file
    ray_object :ExportImageAsCode,        :export_as_code,        [Image.by_value, :string], :void                                                                # Export image as code file defining an array of bytes

    ray_object :LoadTextureFromImage,     :to_texture2d,          [Image.by_value], Texture2D.by_value                                                            # Load texture from image data
    ray_object :LoadTextureCubemap,       :to_texture_cubemap,    [Image.by_value, :int], TextureCubemap                                                          # Load cubemap from image, multiple image cubemap layouts supported

    ray_object :UnloadImage,              :unload,                [Image.by_value], :void                                                                         # Unload image from CPU memory (RAM)

    ray_object :GetImageData,             :to_data,               [Image.by_value], :pointer                                                                      # Get pixel data from image as a Color struct array
    ray_object :GetImageDataNormalized,   :to_data_normalized,    [Image.by_value], :pointer                                                                      # Get pixel data from image as Vector4 array (float normalized)
    ray_object :GetImageAlphaBorder,      :alpha_border,          [Image.by_value, :float], Rectangle.by_value                                                    # Get image alpha border rectangle
    ray_static :GetPixelDataSize,         :pixel_data_size,       %i[int int int], :int                                                                           # Get pixel data size in bytes (image or texture)

    ray_static :GetScreenData,            :screenshot,            [], Image.by_value                                                                              # Get pixel data from screen buffer and return an Image (screenshot)

    # Image manipulation functions
    ray_object :ImageCopy,                :copy,                  [Image.by_value], Image.by_value                                                                # Create an image duplicate (useful for transformations)
    ray_object :ImageFromImage,           :image_rect,            [Image.by_value, Rectangle.by_value], Image.by_value                                            # Create an image from another image piece
    ray_object :ImageToPOT,               :pot!,                  [Image.ptr, Color.by_value], :void                                                              # Convert image to POT (power-of-two)
    ray_object :ImageFormat,              :format!,               [Image.ptr, PixelFormat], :void                                                                 # Convert image data to desired format
    ray_object :ImageAlphaMask,           :alpha_mask!,           [Image.ptr, Image.by_value], :void                                                              # Apply alpha mask to image
    ray_object :ImageAlphaClear,          :alpha_clear!,          [Image.ptr, Color.by_value, :float], :void                                                      # Clear alpha channel to desired color
    ray_object :ImageAlphaCrop,           :alpha_crop!,           [Image.ptr, :float], :void                                                                      # Crop image depending on alpha value
    ray_object :ImageAlphaPremultiply,    :alpha_premultiply!,    [Image.ptr], :void                                                                              # Premultiply alpha channel
    ray_object :ImageCrop,                :crop!,                 [Image.ptr, Rectangle.by_value], :void                                                          # Crop an image to a defined rectangle
    ray_object :ImageResize,              :resize!,               [Image.ptr, :int, :int], :void                                                                  # Resize image (Bicubic scaling algorithm)
    ray_object :ImageResizeNN,            :resize_nn!,            [Image.ptr, :int, :int], :void                                                                  # Resize image (Nearest-Neighbor scaling algorithm)
    ray_object :ImageResizeCanvas,        :resize_canvas!,        [Image.ptr, :int, :int, :int, :int, Color.by_value], :void                                      # Resize canvas and fill with color
    ray_object :ImageMipmaps,             :mipmaps!,              [Image.ptr], :void                                                                              # Generate all mipmap levels for a provided image
    ray_object :ImageDither,              :dither!,               [Image.ptr, :int, :int, :int, :int], :void                                                      # Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    ray_object :ImageExtractPalette,      :palette,               [Image.by_value, :int, :pointer], :pointer                                                      # Extract color palette from image to maximum size (memory should be freed)
    ray_static :ImageText,                :from_text,             [:string, :int, Color.by_value], Image.by_value                                                 # Create an image from text (default font)
    ray_static :ImageTextEx,              :from_text_ex,          [Font.by_value, :string, :float, :float, Color.by_value], Image.by_value                        # Create an image from text (custom sprite font)
    ray_object :ImageDraw,                :draw!,                 [Image.ptr, Image.by_value, Rectangle.by_value, Rectangle.by_value, Color.by_value], :void      # Draw a source image within a destination image (tint applied to source)
    ray_object :ImageDrawRectangle,       :draw_rectangle!,       [Image.ptr, Rectangle.by_value, Color.by_value], :void                                          # Draw rectangle within an image
    ray_object :ImageDrawRectangleLines,  :draw_rectangle_lines!, [Image.ptr, Rectangle.by_value, :int, Color.by_value], :void                                    # Draw rectangle lines within an image
    ray_object :ImageDrawText,            :draw_text!,            [Image.ptr, Vector2.by_value, :string, :int, Color.by_value], :void                             # Draw text (default font) within an image (destination)
    ray_object :ImageDrawTextEx,          :draw_text_ex!,         [Image.ptr, Vector2.by_value, Font.by_value, :string, :float, :float, Color.by_value], :void    # Draw text (custom sprite font) within an image (destination)
    ray_object :ImageFlipVertical,        :flip_vertical!,        [Image.ptr], :void                                                                              # Flip image vertically
    ray_object :ImageFlipHorizontal,      :flip_horizontal!,      [Image.ptr], :void                                                                              # Flip image horizontally
    ray_object :ImageRotateCW,            :rotate_cw!,            [Image.ptr], :void                                                                              # Rotate image clockwise 90deg
    ray_object :ImageRotateCCW,           :rotate_ccw!,           [Image.ptr], :void                                                                              # Rotate image counter-clockwise 90deg
    ray_object :ImageColorTint,           :color_tint!,           [Image.ptr, Color.by_value], :void                                                              # Modify image color: tint
    ray_object :ImageColorInvert,         :color_invert!,         [Image.ptr], :void                                                                              # Modify image color: invert
    ray_object :ImageColorGrayscale,      :color_grayscale!,      [Image.ptr], :void                                                                              # Modify image color: grayscale
    ray_object :ImageColorContrast,       :color_contrast!,       [Image.ptr, :float], :void                                                                      # Modify image color: contrast (-100 to 100)
    ray_object :ImageColorBrightness,     :color_brightness!,     [Image.ptr, :int], :void                                                                        # Modify image color: brightness (-255 to 255)
    ray_object :ImageColorReplace,        :color_replace!,        [Image.ptr, Color.by_value, Color.by_value], :void                                              # Modify image color: replace color

    # Image generation functions
    ray_static :GenImageColor,            :color,                 [:int, :int, Color.by_value], Image.by_value                                                    # Generate image: plain color
    ray_static :GenImageGradientV,        :gradient_v,            [:int, :int, Color.by_value, Color.by_value], Image.by_value                                    # Generate image: vertical gradient
    ray_static :GenImageGradientH,        :gradient_h,            [:int, :int, Color.by_value, Color.by_value], Image.by_value                                    # Generate image: horizontal gradient
    ray_static :GenImageGradientRadial,   :gradient_radial,       [:int, :int, :float, Color.by_value, Color.by_value], Image.by_value                            # Generate image: radial gradient
    ray_static :GenImageChecked,          :checked,               [:int, :int, :int, :int, Color.by_value, Color.by_value], Image.by_value                        # Generate image: checked
    ray_static :GenImageWhiteNoise,       :white_noise,           %i[int int float], Image.by_value                                                               # Generate image: white noise
    ray_static :GenImagePerlinNoise,      :perlin_noise,          %i[int int int int float], Image.by_value                                                       # Generate image: perlin noise
    ray_static :GenImageCellular,         :cellular,              %i[int int int], Image.by_value                                                                 # Generate image: cellular algorithm. Bigger tileSize means bigger cells

    #------------------------------------------------------------------------------------
    # Font Loading and Text Drawing Functions (Module: text)
    #------------------------------------------------------------------------------------

    # Font loading/unloading functions
    ray_object :LoadFontFromImage,        :to_font,               [Image.by_value, Color.by_value, :int], Font.by_value # Load font from Image (XNA style)
  end
end
