require 'raylib'
require 'ostruct'

MAX_BUILDINGS = 100

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

camera = RayCamera2D.new RayVector2.new(0, 0), RayVector2.new(player.x + 20, player.y + 20), 0.0, 1.0
RayWindow.target_fps = 60

until RayWindow.should_close?
  if RayKey.is_down? RayKey::RIGHT
    player.x += 2
    camera.offset.x -= 2
  elsif RayKey.is_down? RayKey::LEFT
    player.x -= 2
    camera.offset.x += 2
  end

  # follow player
  camera.target.x = player.x + 20
  camera.target.y = player.y + 20

  camera.rotation -= 1 if RayKey.is_down? RayKey::A
  camera.rotation += 1 if RayKey.is_down? RayKey::S

  camera.rotation = 40 if camera.rotation > 40
  camera.rotation = -40 if camera.rotation < -40

  camera.zoom += RayMouse.wheel_move * 0.05
  camera.zoom = 3.0 if camera.zoom > 3.0
  camera.zoom = 0.1 if camera.zoom < 0.1

  if RayKey.is_pressed? RayKey::R
    camera.zoom = 1.0
    camera.rotation = 0.0
  end

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode2d do
      RayDraw.rectangle(-6_000, 320, 13_000, 8_000, RayColor::DARKGRAY)

      buildings.each do |building|
        building.rec.draw building.col
      end

      player.draw RayColor::RED

      RayDraw.rectangle(camera.target.x, -500, 1, screen_h * 4, RayColor::GREEN)
      RayDraw.rectangle(-500, camera.target.y, screen_w * 4, 1, RayColor::GREEN)
    end

    RayDraw.text 'SCREEN AREA', 640, 10, 20, RayColor::RED

    RayDraw.rectangle 0, 0, screen_w, 5, RayColor::RED
    RayDraw.rectangle 0, 5, 5, screen_h - 10, RayColor::RED
    RayDraw.rectangle screen_w - 5, 5, 5, screen_h - 10, RayColor::RED
    RayDraw.rectangle 0, screen_h - 5, screen_w, 5 , RayColor::RED

    RayDraw.rectangle 10, 10, 250, 113, RayColor::SKYBLUE.fade(0.5)
    RayDraw.rectangle_lines 10, 10, 250, 113, RayColor::BLUE

    RayDraw.text 'Free 2D camera controls:', 20, 20, 10, RayColor::BLACK
    RayDraw.text '- Right/Left to move Offset', 40, 40, 10, RayColor::DARKGRAY
    RayDraw.text '- Mouse Wheel to Zoom in-out', 40, 60, 10, RayColor::DARKGRAY
    RayDraw.text '- A / S to Rotate', 40, 80, 10, RayColor::DARKGRAY
    RayDraw.text '- R to reset ZOOM and Rotation', 40, 100, 10, RayColor::DARKGRAY
  end
end

RayWindow.close
