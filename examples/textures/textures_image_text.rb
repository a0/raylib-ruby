# /*******************************************************************************************
# *
# *   raylib [texture] example - Image text drawing using TTF generated spritefont
# *
# *   This example has been created using raylib 1.8 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2017 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [texture] example - image text drawing'

# TTF Font loading with custom generation parameters
font = RayFont.load_ex 'resources/KAISG.ttf', 64, 0, 0

image = RayImage.load 'resources/parrots.png' # Loaded in CPU memory (RAM)

# Draw over image using custom font
image.draw_text_ex! RayVector2.new(20, 20), font, '[Parrots font drawing]', font.base_size, 0, :white

texture = image.to_texture2d  # Image converted to texture, uploaded to GPU memory (VRAM)
image.unload                  # Once image has been converted to texture and uploaded to VRAM, it can be unloaded from RAM

position = RayVector2.new screen_w / 2 - texture.width / 2, screen_h / 2 - texture.height / 2 - 20

show_font = false

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  show_font = RayKey.down? :space

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    if show_font
      font.texture.draw screen_w / 2 - font.texture.width / 2, 50, :black
    else
      # Draw texture with text already drawn inside
      texture.draw_v position, :white

      # Draw text directly using sprite font
      RayDraw.text_ex font, '[Parrots font drawing]', RayVector2.new(position.x + 20, position.y + 20 + 280), font.base_size, 0, :white
    end

    RayDraw.text 'PRESS SPACE to SEE USED SPRITEFONT', 290, 420, 10, :darkgray
  end
end

# De-Initialization
texture.unload  # Texture unloading
font.unload     # Unload custom spritefont
RayWindow.close # Close window and OpenGL context
