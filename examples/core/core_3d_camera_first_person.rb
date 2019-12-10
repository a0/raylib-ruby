# /*******************************************************************************************
# *
# *   raylib [core] example - 3d camera first person
# *
# *   This example has been created using raylib 1.3 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2015 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'
require 'ostruct'

MAX_COLUMNS = 20

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [core] example - 3d camera first person'

# Define the camera to look into our 3d world (position, target, up vector)
camera = RayCamera.new  RayVector3.new(4.0, 2.0, 4.0),
                        RayVector3.new(0.0, 1.8, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        60.0,
                        :perspective

# Generates some random columns
columns = Array.new(MAX_COLUMNS) do
  height = rand(1..12).to_f
  position = RayVector3.new rand(-15..15), height / 2, rand(-15..15)
  color = RayColor.new rand(20..255), rand(10..55), 30, 255

  OpenStruct.new height: height, position: position, color: color
end

# Set a first person camera mode
camera.mode = :first_person

# Set our game to run at 60 frames-per-second
RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  camera.update

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    camera.mode3d do
      RayDraw.plane RayVector3.new(0.0, 0.0, 0.0), RayVector2.new(32.0, 32.0), :lightgray  # Draw ground
      RayDraw.cube RayVector3.new(-16.0, 2.5, 0.0), 1.0, 5.0, 32.0, :blue                  # Draw a blue wall
      RayDraw.cube RayVector3.new(16.0, 2.5, 0.0), 1.0, 5.0, 32.0, :lime                   # Draw a green wall
      RayDraw.cube RayVector3.new(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, :gold                   # Draw a yellow yall

      # Draw some cubes around
      columns.each do |column|
        RayDraw.cube column.position, 2.0, column.height, 2.0, column.color
        RayDraw.cube_wires column.position, 2.0, column.height, 2.0, :maroon
      end
    end

    RayDraw.rectangle 10, 10, 220, 70, RayColor.fade(:skyblue, 0.5)
    RayDraw.rectangle_lines 10, 10, 220, 70, :blue

    RayDraw.text 'First person camera default controls:', 20, 20, 10, :black
    RayDraw.text '- Move with keys: W, A, S, D', 40, 40, 10, :darkgray
    RayDraw.text '- Mouse move to look around', 40, 60, 10, :darkgray
  end
end

# De-Initialization
RayWindow.close # Close window and OpenGL context
