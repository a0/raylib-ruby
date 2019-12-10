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
images << RayImage.gradient_v(screen_w, screen_h, :red, :blue)
images << RayImage.gradient_h(screen_w, screen_h, :red, :blue)
images << RayImage.gradient_radial(screen_w, screen_h, 0.0, :white, :black)
images << RayImage.checked(screen_w, screen_h, 32, 32, :red, :blue)
images << RayImage.white_noise(screen_w, screen_h, 0.5)
images << RayImage.perlin_noise(screen_w, screen_h, 50, 50, 4.0)
images << RayImage.cellular(screen_w, screen_h, 32)

textures = images.map(&:to_texture2d)
images.each(&:unload) # Unload image data (CPU RAM)

current_texture = 0

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close?
  # Update
  current_texture = (current_texture + 1) % NUM_TEXTURES if RayMouse.button_pressed?(:left) || RayKey.pressed?(:right)

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    textures[current_texture].draw 0, 0, :white

    RayDraw.rectangle 30, 400, 325, 30, RayColor.fade(:skyblue, 0.5)
    RayDraw.rectangle_lines 30, 400, 325, 30, RayColor.fade(:white, 0.5)
    RayDraw.text 'MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES', 40, 410, 10, :white

    case current_texture
    when 0
      RayDraw.text 'VERTICAL GRADIENT', 560, 10, 20, :raywhite
    when 1
      RayDraw.text 'HORIZONTAL GRADIENT', 540, 10, 20, :raywhite
    when 2
      RayDraw.text 'RADIAL GRADIENT', 580, 10, 20, :lightgray
    when 3
      RayDraw.text 'CHECKED', 680, 10, 20, :raywhite
    when 4
      RayDraw.text 'WHITE NOISE', 640, 10, 20, :red
    when 5
      RayDraw.text 'PERLIN NOISE', 630, 10, 20, :raywhite
    when 6
      RayDraw.text 'CELLULAR', 670, 10, 20, :raywhite
    end
  end
end

# De-Initialization
textures.map(&:unload) # Unload textures data (GPU VRAM)
RayWindow.close # Close window and OpenGL context
