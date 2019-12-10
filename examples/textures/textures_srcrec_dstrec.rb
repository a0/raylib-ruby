# /*******************************************************************************************
# *
# *   raylib [textures] example - Texture source and destination rectangles
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

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] examples - texture source and destination rectangles'

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
scarfy = RayTexture.load 'resources/scarfy.png' # Texture loading

frame_width = scarfy.width / 6
frame_height = scarfy.height

# NOTE: Source rectangle (part of the texture to use for drawing)
source_rec = RayRectangle.new 0, 0, frame_width, frame_height

# NOTE: Destination rectangle (screen rectangle where drawing part of texture)
dest_rec = RayRectangle.new screen_w / 2, screen_h / 2, frame_width * 2, frame_height * 2

# NOTE: Origin of the texture (rotation/scale point), it's relative to destination rectangle size
origin = RayVector2.new frame_width, frame_height

rotation = 0

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  rotation += 1

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :raywhite

    # NOTE: Using Texture#draw_pro we can easily rotate and scale the part of the texture we draw
    # sourceRec defines the part of the texture we use for drawing
    # destRec defines the rectangle where our texture part will fit (scaling it to fit)
    # origin defines the point of the texture used as reference for rotation and scaling
    # rotation defines the texture rotation (using origin as rotation point)
    scarfy.draw_pro source_rec, dest_rec, origin, rotation, :white

    RayDraw.line dest_rec.x, 0, dest_rec.x, screen_h, :gray
    RayDraw.line 0, dest_rec.y, screen_w, dest_rec.y, :gray

    RayDraw.text '(c) Scarfy sprite by Eiden Marsal', screen_w - 200, screen_h - 20, 10, :gray
  end
end

# De-Initialization
scarfy.unload # Texture unloading
RayWindow.close # Close window and OpenGL context
