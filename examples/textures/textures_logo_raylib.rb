# /*******************************************************************************************
# *
# *   raylib [textures] example - Texture loading and drawing
# *
# *   This example has been created using raylib 1.0 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2014 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] example - texture loading and drawing'

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)

texture = RayTexture.load 'resources/raylib_logo.png' # Texture loading

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  # TODO: Update your variables here

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::RAYWHITE

    texture.draw screen_w / 2 - texture.width / 2, screen_h / 2 - texture.height / 2, RayColor::WHITE

    RayDraw.text 'this IS a texture!', 360, 370, 10, RayColor::GRAY
  end
end

# De-Initialization
texture.unload  # Texture unloading
RayWindow.close # Close window and OpenGL context
