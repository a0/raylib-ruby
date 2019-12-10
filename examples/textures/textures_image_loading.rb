# /*******************************************************************************************
# *
# *   raylib [textures] example - Image loading and texture creation
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

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] example - image loading'

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)

image = RayImage.load 'resources/raylib_logo.png' # Loaded in CPU memory (RAM)
texture = image.to_texture2d                      # Image converted to texture, GPU memory (VRAM)

# Once image has been converted to texture and uploaded to VRAM, it can be unloaded from RAM
image.unload

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  # TODO: Update your variables here

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    texture.draw screen_w / 2 - texture.width / 2, screen_h / 2 - texture.height / 2, :white
    RayDraw.text 'this IS a texture loaded from an image!', 300, 370, 10, :gray
  end
end

# De-Initialization
texture.unload  # Texture unloading
RayWindow.close # Close window and OpenGL context
