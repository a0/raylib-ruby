# /*******************************************************************************************
# *
# *   raylib [textures] example - Texture loading and drawing a part defined by a rectangle
# *
# *   This example has been created using raylib 1.3 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2014 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

MAX_FRAME_SPEED = 15
MIN_FRAME_SPEED = 1

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [texture] example - texture rectangle'

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
scarfy = RayTexture.load 'resources/scarfy.png'

position = RayVector2.new 350.0, 280.0
frame_rec = RayRectangle.new 0.0, 0.0, scarfy.width / 6.0, scarfy.height
current_frame = 0

frames_counter = 0
frames_speed = 8 # Number of spritesheet frames shown by second

# Set our game to run at 60 frames-per-second
RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  frames_counter += 1
  if frames_counter >= 60 / frames_speed
    frames_counter = 0
    current_frame += 1

    current_frame = 0 if current_frame > 5

    frame_rec.x = current_frame.to_f * scarfy.width / 6
  end

  frames_speed += 1 if RayKey.is_pressed? :right
  frames_speed -= 1 if RayKey.is_pressed? :left

  frames_speed = MAX_FRAME_SPEED if frames_speed > MAX_FRAME_SPEED
  frames_speed = MIN_FRAME_SPEED if frames_speed < MIN_FRAME_SPEED

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    scarfy.draw 15, 40, RayColor::WHITE
    RayDraw.rectangle_lines 15, 40, scarfy.width, scarfy.height, RayColor::LIME
    RayDraw.rectangle_lines 15 + frame_rec.x, 40 + frame_rec.y, frame_rec.width, frame_rec.height, RayColor::RED

    RayDraw.text 'FRAME SPEED: ', 165, 210, 10, RayColor::DARKGRAY
    RayDraw.text format('%<frames_speed>02i FPS', frames_speed: frames_speed), 575, 210, 10, RayColor::DARKGRAY
    RayDraw.text 'PRESS RIGHT/LEFT KEYS to CHANGE SPEED!', 290, 240, 10, RayColor::DARKGRAY

    (1..MAX_FRAME_SPEED).each do |i|
      RayDraw.rectangle 229 + 21 * i, 205, 20, 20, RayColor::RED if i <= frames_speed
      RayDraw.rectangle_lines 229 + 21 * i, 205, 20, 20, RayColor::MAROON
    end

    scarfy.draw_rec frame_rec, position, RayColor::WHITE

    RayDraw.text '(c) Scarfy sprite by Eiden Marsal', screen_w - 200, screen_h - 20, 10, RayColor::GRAY
  end
end

# De-Initialization
scarfy.unload # Texture unloading
RayWindow.close # Close window and OpenGL context
