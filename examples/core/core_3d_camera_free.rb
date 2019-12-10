# /*******************************************************************************************
# *
# *   raylib [core] example - Initialize 3d camera free
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

RayWindow.init screen_w, screen_h, 'ruby raylib [core] example - 3d camera free'

# Define the camera to look into our 3d world
camera = RayCamera.new  RayVector3.new(1.0, 10.0, 10.0),  # Camera position
                        RayVector3.new(0.0, 0.0, 0.0),    # Camera looking at point
                        RayVector3.new(0.0, 1.0, 0.0),    # Camera up vector (rotation towards target)
                        45.0,                             # Camera field-of-view Y
                        :perspective                      # Camera mode type

cube_position = RayVector3.new 0.0, 0.0, 0.0

# Set a free camera mode
camera.mode = :free

# Set our game to run at 60 frames-per-second
RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  camera.update

  camera.target = RayVector3.new 0.0, 0.0, 0.0 if RayKey.down? :z

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    camera.mode3d do
      RayDraw.cube cube_position, 2.0, 2.0, 2.0, :red
      RayDraw.cube_wires cube_position, 2.0, 2.0, 2.0, :maroon

      RayDraw.grid 10, 1.0
    end

    RayDraw.rectangle 10, 10, 320, 133, RayColor.fade(:skyblue, 0.5)
    RayDraw.rectangle_lines 10, 10, 320, 133, :blue

    RayDraw.text 'Free camera default controls:', 20, 20, 10, :black
    RayDraw.text '- Mouse wheel to Zoom in-out', 40, 40, 10, :darkgray
    RayDraw.text '- Mouse wheel Pressed to Pan', 40, 60, 10, :darkgray
    RayDraw.text '- Alt + Mouse Wheel Pressed to Rotate', 40, 80, 10, :darkgray
    RayDraw.text '- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom', 40, 100, 10, :darkgray
    RayDraw.text '- Z to zoom to (0, 0, 0)', 40, 120, 10, :darkgray
  end
end

# De-Initialization
RayWindow.close # Close window and OpenGL context
