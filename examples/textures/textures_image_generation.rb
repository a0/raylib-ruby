# /*******************************************************************************************
# *
# *   raylib [textures] example - Procedural images generation
# *
# *   This example has been created using raylib 1.8 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2O17 Wilhem Barbier (@nounoursheureux)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

NUM_TEXTURES = 7 # Currently we have 7 generation algorithms

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] example - procedural images generation'

images = []
images << RayImage.gen_gradient_v(screen_w, screen_h, RayColor::RED, RayColor::BLUE)
images << RayImage.gen_gradient_h(screen_w, screen_h, RayColor::RED, RayColor::BLUE)
images << RayImage.gen_gradient_radial(screen_w, screen_h, 0.0, RayColor::WHITE, RayColor::BLACK)
images << RayImage.gen_checked(screen_w, screen_h, 32, 32, RayColor::RED, RayColor::BLUE)
images << RayImage.gen_white_noise(screen_w, screen_h, 0.5)
images << RayImage.gen_perlin_noise(screen_w, screen_h, 50, 50, 4.0)
images << RayImage.gen_cellular(screen_w, screen_h, 32)

textures = images.map(&:to_texture2d)
images.each(&:unload) # Unload image data (CPU RAM)

current_texture = 0

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close?
  # Update
  current_texture = (current_texture + 1) % NUM_TEXTURES if RayMouse.is_button_pressed?(RayMouse::LEFT_BUTTON) || RayKey.is_pressed?(RayKey::RIGHT)

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    textures[current_texture].draw 0, 0, RayColor::WHITE

    RayDraw.rectangle 30, 400, 325, 30, RayColor::SKYBLUE.fade(0.5)
    RayDraw.rectangle_lines 30, 400, 325, 30, RayColor::WHITE.fade(0.5)
    RayDraw.text 'MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES', 40, 410, 10, RayColor::WHITE

    case current_texture
    when 0
      RayDraw.text 'VERTICAL GRADIENT', 560, 10, 20, RayColor::RAYWHITE
    when 1
      RayDraw.text 'HORIZONTAL GRADIENT', 540, 10, 20, RayColor::RAYWHITE
    when 2
      RayDraw.text 'RADIAL GRADIENT', 580, 10, 20, RayColor::LIGHTGRAY
    when 3
      RayDraw.text 'CHECKED', 680, 10, 20, RayColor::RAYWHITE
    when 4
      RayDraw.text 'WHITE NOISE', 640, 10, 20, RayColor::RED
    when 5
      RayDraw.text 'PERLIN NOISE', 630, 10, 20, RayColor::RAYWHITE
    when 6
      RayDraw.text 'CELLULAR', 670, 10, 20, RayColor::RAYWHITE
    end
  end
end

# De-Initialization
textures.map(&:unload) # Unload textures data (GPU VRAM)
RayWindow.close # Close window and OpenGL context
