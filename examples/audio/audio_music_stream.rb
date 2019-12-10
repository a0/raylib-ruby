# /*******************************************************************************************
# *
# *   raylib [audio] example - Music playing (streaming)
# *
# *   NOTE: This example requires OpenAL Soft library installed
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

RayWindow.init screen_w, screen_h, 'ruby raylib [audio] example - music playing (streaming)'

RayAudioDevice.init # Initialize audio device

music = RayMusic.load 'resources/guitar_noodling.ogg'

music.play

time_played = 0.0
pause = false

RayWindow.target_fps = 60 # Set our game to run at 60 frames-per-second

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  music.update # Update music buffer with new stream data

  if RayKey.pressed? :space
    music.stop
    music.play
  end

  if RayKey.pressed? :p
    pause = !pause
    pause ? music.pause : music.resume
  end

  # Get time_played scaled to bar dimensions
  time_played = music.time_played / music.time_length * 400

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    RayDraw.text 'MUSIC SHOULD BE PLAYING!', 255, 150, 20, :lightgray

    RayDraw.rectangle 200, 200, 400, 12, :lightgray
    RayDraw.rectangle 200, 200, time_played.to_i, 12, :maroon
    RayDraw.rectangle_lines 200, 200, 400, 12, :gray

    RayDraw.text 'PRESS SPACE TO RESTART MUSIC', 215, 250, 20, :lightgray
    RayDraw.text 'PRESS P TO PAUSE/RESUME MUSIC', 208, 280, 20, :lightgray
  end
end

# De-Initialization
music.unload          # Unload music stream buffers from RAM
RayAudioDevice.close  # Close audio device (music streaming is automatically stopped)
RayWindow.close       # Close window and OpenGL context
