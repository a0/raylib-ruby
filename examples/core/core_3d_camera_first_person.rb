require 'raylib'

MAX_COLUMNS = 20

screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'raylib [core] example - 3d camera first person'

camera = RayCamera.new  RayVector3.new(4.0, 2.0, 4.0),
                        RayVector3.new(0.0, 1.8, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        60.0,
                        RayCamera::TYPE_PERSPECTIVE

columns = Array.new(MAX_COLUMNS) do
  height = rand(1..12).to_f
  position = RayVector3.new rand(-15..15), height / 2, rand(-15..15)
  color = RayColor.new rand(20..255), rand(10..55), 30, 255

  OpenStruct.new height: height, position: position, color: color
end

camera.mode = RayCamera::MODE_FIRST_PERSON

RayWindow.target_fps = 60

until RayWindow.should_close?
  camera.update

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      RayDraw.plane RayVector3.new(0.0, 0.0, 0.0), RayVector2.new(32.0, 32.0), RayColor::LIGHTGRAY
      RayDraw.cube RayVector3.new(-16.0, 2.5, 0.0), 1.0, 5.0, 32.0, RayColor::BLUE
      RayDraw.cube RayVector3.new(16.0, 2.5, 0.0), 1.0, 5.0, 32.0, RayColor::LIME
      RayDraw.cube RayVector3.new(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, RayColor::GOLD

      columns.each do |column|
        RayDraw.cube column.position, 2.0, column.height, 2.0, column.color
        RayDraw.cube_wires column.position, 2.0, column.height, 2.0, RayColor::MAROON
      end
    end

    RayDraw.rectangle 10, 10, 220, 70, RayColor::SKYBLUE.fade(0.5)
    RayDraw.rectangle_lines 10, 10, 220, 70, RayColor::BLUE

    RayDraw.text 'First person camera default controls::', 20, 20, 10, RayColor::BLACK
    RayDraw.text '- Move with keys: W, A, S, D', 40, 40, 10, RayColor::DARKGRAY
    RayDraw.text '- Mouse move to look around', 40, 60, 10, RayColor::DARKGRAY
  end
end

RayWindow.close
