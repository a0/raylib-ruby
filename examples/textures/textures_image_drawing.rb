# /*******************************************************************************************
# *
# *   raylib [textures] example - Image loading and drawing on it
# *
# *   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
# *
# *   This example has been created using raylib 1.4 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2016 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] example - image drawing'

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
cat = RayImage.load 'resources/cat.png'         # Load image in CPU memory (RAM)
cat.crop! RayRectangle.new(100, 10, 280, 380)   # Crop an image piece
cat.flip_horizontal!                            # Flip cropped image horizontally
cat.resize! 150, 200                            # Resize flipped-cropped image

parrots = RayImage.load 'resources/parrots.png' # Load image in CPU memory (RAM)

# Draw one image over the other with a scaling of 1.5f
parrots.draw! cat, RayRectangle.new(0, 0, cat.width, cat.height), RayRectangle.new(30, 40, cat.width * 1.5, cat.height * 1.5)
parrots.crop! RayRectangle.new(0, 50, parrots.width, parrots.height - 100) # Crop resulting image

# Unload image from RAM
cat.unload

# Load custom font for drawing on image
font = RayFont.load 'resources/custom_jupiter_crash.png'

# Draw over image using custom font
parrots.draw_text_ex! RayVector2.new(300, 200), font, 'PARROTS & CAT', font.base_size, -2, :white

# Unload custom spritefont (already drawn used on image)
font.unload

texture = parrots.to_texture2d  # Image converted to texture, uploaded to GPU memory (VRAM)
parrots.unload                  # Once image has been converted to texture and uploaded to VRAM, it can be unloaded from RAM

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    texture.draw screen_w / 2 - texture.width / 2, screen_h / 2 - texture.height / 2 - 40, :white
    RayDraw.rectangle_lines screen_w / 2 - texture.width / 2, screen_h / 2 - texture.height / 2 - 40, texture.width, texture.height, :darkgray

    RayDraw.text 'We are drawing only one texture from various images composed!', 240, 350, 10, :gray
    RayDraw.text 'Source images have been cropped, scaled, flipped and copied one over the other.', 190, 370, 10, :gray
    RayDraw.text "Texture: #{texture.width} #{texture.height}", 190, 390, 10, :gray
  end
end

# De-Initialization
texture.unload # Texture unloading
RayWindow.close # Close window and OpenGL context
