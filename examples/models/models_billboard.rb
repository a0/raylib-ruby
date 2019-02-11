require 'raylib'
require 'pry'

screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'raylib [models] example - drawing billboards'

camera = RayCamera.new  RayVector3.new(5.0, 4.0, 5.0),
                        RayVector3.new(0.0, 2.0, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        45.0,
                        RayCamera::TYPE_PERSPECTIVE

bill_tex = RayTexture2D.load 'resources/billboard.png'
bill_pos = RayVector3.new 0.0, 2.0, 0.0

camera.mode = RayCamera::MODE_ORBITAL
Raylib.target_fps = 60

until RayWindow.should_close?
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.update

    camera.begin_mode3d do
      RayDraw.billboard camera, bill_tex, bill_pos, 2.0, RayColor::WHITE
      RayDraw.grid 10, 1.0
    end

    RayDraw.fps 10, 10
  end
end

bill_tex.unload
RayWindow.close
