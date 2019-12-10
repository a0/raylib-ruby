# /*******************************************************************************************
# *
# *   raylib [core] example - Basic window
# *
# *   Welcome to raylib!
# *
# *   To test examples, just press F6 and execute raylib_compile_execute script
# *   Note that compiled executable is placed in the same folder as .c file
# *
# *   You can find all basic examples on C:\raylib\raylib\examples folder or
# *   raylib official webpage: www.raylib.com
# *
# *   Enjoy using raylib. :)
# *
# *   This example has been created using raylib 1.0 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2013-2016 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [core] example - basic window'

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :raywhite

    RayDraw.text 'Congrats! You created your first window!', 190, 200, 20, :lightgray
  end
end

# De-Initialization
RayWindow.close # Close window and OpenGL context
