# /*******************************************************************************************
# *
# *   raylib [textures] example - Retrieve image data from texture: GetTextureData() 
# *
# *   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
# *
# *   This example has been created using raylib 1.3 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2015 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] example - texture to image'

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)

image = RayImage.load 'resources/raylib_logo.png' # Load image data into CPU memory (RAM)
texture = image.to_texture2d                      # Image converted to texture, GPU memory (RAM -> VRAM)
image.unload                                      # Unload image data from CPU memory (RAM)

image = texture.to_image                          # Retrieve image data from GPU memory (VRAM -> RAM)
texture.unload                                    # Unload texture from GPU memory (VRAM)

texture = image.to_texture2d                      # Recreate texture from retrieved image data (RAM -> VRAM)
image.unload                                      # Unload retrieved image data from CPU memory (RAM)

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  # TODO: Update your variables here

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::RAYWHITE

    texture.draw screen_w / 2 - texture.width / 2, screen_h / 2 - texture.height / 2, RayColor::WHITE

    RayDraw.text 'this IS a texture loaded from an image!', 300, 370, 10, RayColor::GRAY
  end
end

# De-Initialization
texture.unload  # Texture unloading
RayWindow.close # Close window and OpenGL context
