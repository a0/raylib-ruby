# /*******************************************************************************************
# *
# *   raylib [core] example - Picking in 3d mode
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

RayWindow.init screen_w, screen_h, 'ruby raylib [core] example - 3d mode'

# Define the camera to look into our 3d world
camera = RayCamera.new  RayVector3.new(10.0, 10.0, 10.0), # Camera position
                        RayVector3.new(0.0, 0.0, 0.0),    # Camera looking at point
                        RayVector3.new(0.0, 1.0, 0.0),    # Camera up vector (rotation towards target)
                        45.0,                             # Camera field-of-view Y
                        RayCamera::TYPE_PERSPECTIVE       # Camera mode type

cube_position = RayVector3.new 0.0, 0.0, 0.0
cube_size = RayVector3.new 2.0, 2.0, 2.0
ray = RayRay.new RayVector3.new(0.0, 0.0, 0.0), RayVector3.new(0.0, 0.0, 0.0)
collision = false

# Set a free camera mode
camera.mode = RayCamera::MODE_FREE

# Set our game to run at 60 frames-per-second
RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  camera.update

  if RayMouse.is_button_pressed? RayMouse::LEFT_BUTTON
    # Picking line ray
    ray = camera.ray RayMouse.position
    bounding_box = RayBoundingBox.new RayVector3.new(cube_position.x - cube_size.x / 2, cube_position.y - cube_size.y / 2, cube_position.z - cube_size.z / 2),
                                      RayVector3.new(cube_position.x + cube_size.x / 2, cube_position.y + cube_size.y / 2, cube_position.z + cube_size.z / 2)

    collision = RayCollision.check_ray_box ray, bounding_box
  end

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      if collision
        RayDraw.cube cube_position, cube_size.x, cube_size.y, cube_size.z, RayColor::RED
        RayDraw.cube_wires cube_position, cube_size.x, cube_size.y, cube_size.z, RayColor::MAROON

        RayDraw.cube_wires cube_position, cube_size.x + 0.2, cube_size.y + 0.2, cube_size.z + 0.2, RayColor::GREEN
      else
        RayDraw.cube cube_position, cube_size.x, cube_size.y, cube_size.z, RayColor::GRAY
        RayDraw.cube_wires cube_position, cube_size.x, cube_size.y, cube_size.z, RayColor::DARKGRAY
      end

      ray.draw RayColor::MAROON
      RayDraw.grid 10, 1.0
    end

    RayDraw.text 'Try selecting the box with mouse!', 240, 10, 20, RayColor::DARKGRAY

    RayDraw.text 'BOX SELECTED', (screen_w - RayFont.measure_text('BOX SELECTED', 30)) / 2, screen_h * 0.1, 30, RayColor::GREEN

    RayDraw.fps 10, 10
  end
end

# De-Initialization
RayWindow.close # Close window and OpenGL context
