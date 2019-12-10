# /*******************************************************************************************
# *
# *   raylib [core] example - 2d camera
# *
# *   This example has been created using raylib 1.5 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2016 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'
require 'ostruct'

MAX_BUILDINGS = 100

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [core] example - 2d camera'

player = RayRectangle.new 400, 280, 40, 40
spacing = 0
buildings = Array.new(MAX_BUILDINGS) do
  w = rand(50..200)
  h = rand(100..800)
  rec = RayRectangle.new spacing - 6_000, screen_h - 130 - h, w, h
  col = RayColor.new rand(200..240), rand(200..240), rand(200..250), 255

  spacing += w
  OpenStruct.new rec: rec, col: col
end

camera = RayCamera2D.new  RayVector2.new(screen_w / 2, screen_h / 2),
                          RayVector2.new(player.x + 20, player.y + 20),
                          0.0,
                          1.0

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key

  # Update
  if RayKey.down? :right
    player.x += 2             # Player movement
    camera.offset.x -= 2      # Camera displacement with player movement
  elsif RayKey.down? :left
    player.x -= 2             # Player movement
    camera.offset.x += 2      # Camera displacement with player movement
  end

  # Camera target follows player
  camera.target.x = player.x + 20
  camera.target.y = player.y + 20

  # Camera rotation controls
  camera.rotation -= 1 if RayKey.down? :a
  camera.rotation += 1 if RayKey.down? :s

  # Limit camera rotation to 80 degrees (-40 to 40)
  camera.rotation = 40 if camera.rotation > 40
  camera.rotation = -40 if camera.rotation < -40

  # Camera zoom controls
  camera.zoom += RayMouse.wheel_move * 0.05
  camera.zoom = 3.0 if camera.zoom > 3.0
  camera.zoom = 0.1 if camera.zoom < 0.1

  # Camera reset (zoom and rotation)
  if RayKey.pressed? :r
    camera.zoom = 1.0
    camera.rotation = 0.0
  end

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    camera.mode2d do
      RayDraw.rectangle(-6_000, 320, 13_000, 8_000, :darkgray)

      buildings.each do |building|
        building.rec.draw building.col
      end

      player.draw :red

      RayDraw.rectangle(camera.target.x, -500, 1, screen_h * 4, :green)
      RayDraw.rectangle(-500, camera.target.y, screen_w * 4, 1, :green)
    end

    RayDraw.text 'SCREEN AREA', 640, 10, 20, :red

    RayDraw.rectangle 0, 0, screen_w, 5, :red
    RayDraw.rectangle 0, 5, 5, screen_h - 10, :red
    RayDraw.rectangle screen_w - 5, 5, 5, screen_h - 10, :red
    RayDraw.rectangle 0, screen_h - 5, screen_w, 5, :red

    RayDraw.rectangle 10, 10, 250, 113, RayColor.fade(:skyblue, 0.5)
    RayDraw.rectangle_lines 10, 10, 250, 113, :blue

    RayDraw.text 'Free 2D camera controls:', 20, 20, 10, :black
    RayDraw.text '- Right/Left to move Offset', 40, 40, 10, :darkgray
    RayDraw.text '- Mouse Wheel to Zoom in-out', 40, 60, 10, :darkgray
    RayDraw.text '- A / S to Rotate', 40, 80, 10, :darkgray
    RayDraw.text '- R to reset ZOOM and Rotation', 40, 100, 10, :darkgray
  end
end

# De-Initialization
RayWindow.close # Close window and OpenGL context
