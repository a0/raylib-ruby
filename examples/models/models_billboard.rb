# /*******************************************************************************************
# *
# *   raylib [models] example - Drawing billboards
# *
# *   This example has been created using raylib 1.3 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2015 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [models] example - drawing billboards'

camera = RayCamera.new  RayVector3.new(5.0, 4.0, 5.0),
                        RayVector3.new(0.0, 2.0, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        45.0,
                        RayCamera::TYPE_PERSPECTIVE

bill_tex = RayTexture2D.load 'resources/billboard.png'
bill_pos = RayVector3.new 0.0, 2.0, 0.0

camera.mode = RayCamera::MODE_ORBITAL
RayWindow.target_fps = 60

until RayWindow.should_close?
  camera.update

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      RayDraw.grid 10, 1.0
      RayDraw.billboard camera, bill_tex, bill_pos, 2.0, RayColor::WHITE
    end

    RayDraw.fps 10, 10
  end
end

bill_tex.unload
RayWindow.close
