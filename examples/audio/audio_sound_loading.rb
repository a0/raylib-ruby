# /*******************************************************************************************
# *
# *   raylib [audio] example - Sound loading and playing
# *
# *   NOTE: This example requires OpenAL Soft library installed
# *
# *   This example has been created using raylib 1.0 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2014 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [audio] example - sound loading and playing'

RayAudioDevice.init # Initialize audio device

fx_wav = RaySound.load 'resources/sound.wav'
fx_ogg = RaySound.load 'resources/tanatana.ogg'

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  fx_wav.play if RayKey.pressed? :space   # Play WAV sound
  fx_ogg.play if RayKey.pressed? :enter   # Play OGG sound

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :white

    RayDraw.text 'Press SPACE to PLAY the WAV sound!', 200, 180, 20, :lightgray
    RayDraw.text 'Press ENTER to PLAY the OGG sound!', 200, 220, 20, :lightgray
  end
end

# De-Initialization
fx_wav.unload         # Unload sound data
fx_ogg.unload         # Unload sound data
RayAudioDevice.close  # Close audio device (music streaming is automatically stopped)
RayWindow.close       # Close window and OpenGL context
