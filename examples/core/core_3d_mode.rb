# /*******************************************************************************************
# *
# *   raylib [core] example - Initialize 3d mode
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

RayWindow.init screen_w, screen_h, 'ruby raylib [core] example - 3d mode'

# Define the camera to look into our 3d world
camera = RayCamera.new  RayVector3.new(0.0, 10.0, 10.0),  # Camera position
                        RayVector3.new(0.0, 0.0, 0.0),    # Camera looking at point
                        RayVector3.new(0.0, 1.0, 0.0),    # Camera up vector (rotation towards target)
                        45.0,                             # Camera field-of-view Y
                        RayCamera::TYPE_PERSPECTIVE       # Camera mode type

cube_position = RayVector3.new 0.0, 0.0, 0.0

# Set our game to run at 60 frames-per-second
RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  # TODO: Update your variables here

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      RayDraw.cube cube_position, 2.0, 2.0, 2.0, RayColor::RED
      RayDraw.cube_wires cube_position, 2.0, 2.0, 2.0, RayColor::MAROON

      RayDraw.grid 10, 1.0
    end

    RayDraw.text 'Welcome to the third dimension!', 10, 40, 20, RayColor::DARKGRAY
  end
end

# De-Initialization
RayWindow.close # Close window and OpenGL context
