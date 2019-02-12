require 'raylib'

screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [core] example - 3d camera free'

camera = RayCamera.new  RayVector3.new(1.0, 10.0, 10.0),
                        RayVector3.new(0.0, 0.0, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        45.0,
                        RayCamera::TYPE_PERSPECTIVE

camera.mode = RayCamera::MODE_FREE

RayWindow.target_fps = 60

cube_position = RayVector3.new 0.0, 0.0, 0.0

until RayWindow.should_close?
  camera.update

  camera.target = RayVector3.new 0.0, 0.0, 0.0 if RayKey.is_down? RayKey::Z

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      RayDraw.cube cube_position, 2.0, 2.0, 2.0, RayColor::RED
      RayDraw.cube_wires cube_position, 2.0, 2.0, 2.0, RayColor::MAROON

      RayDraw.grid 10, 1.0
    end

    RayDraw.rectangle 10, 10, 320, 133, RayColor::SKYBLUE.fade(0.5)
    RayDraw.rectangle_lines 10, 10, 320, 133, RayColor::BLUE

    RayDraw.text 'Free camera default controls::', 20, 20, 10, RayColor::BLACK
    RayDraw.text '- Mouse wheel to Zoom in-out', 40, 40, 10, RayColor::DARKGRAY
    RayDraw.text '- Mouse wheel Pressed to Pan', 40, 60, 10, RayColor::DARKGRAY
    RayDraw.text '- Alt + Mouse Wheel Pressed to Rotate', 40, 80, 10, RayColor::DARKGRAY
    RayDraw.text '- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom', 40, 100, 10, RayColor::DARKGRAY
    RayDraw.text '- Z to zoom to (0, 0, 0)', 40, 120, 10, RayColor::DARKGRAY
  end
end

RayWindow.close
