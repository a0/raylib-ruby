# /*******************************************************************************************
# *
# *   raylib [audio] example - Module playing (streaming)
# *
# *   NOTE: This example requires OpenAL Soft library installed
# *
# *   This example has been created using raylib 1.5 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2016 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

MAX_CIRCLES = 64

CircleWave = Struct.new :position, :radius, :alpha, :speed, :color, keyword_init: true do
end

# Initialization
screen_w = 800
screen_h = 450

# NOTE: Try to enable MSAA 4X
Raylib.config_flags = Raylib::FLAG_MSAA_4X_HINT

RayWindow.init screen_w, screen_h, 'ruby raylib [audio] example - module playing (streaming)'

RayAudioDevice.init # Initialize audio device

colors = [RayColor::ORANGE, RayColor::RED, RayColor::GOLD, RayColor::LIME, RayColor::BLUE, RayColor::VIOLET,
          RayColor::BROWN, RayColor::LIGHTGRAY, RayColor::PINK, RayColor::YELLOW, RayColor::GREEN,
          RayColor::SKYBLUE, RayColor::PURPLE, RayColor::BEIGE]

# Creates [s]ome circles for visual effect
circles = Array.new MAX_CIRCLES do
  alpha = 0.0
  radius = rand(10..40)
  position = RayVector2.new rand(radius..screen_w - radius), rand(radius..screen_h - radius)
  speed = rand(1..100) / 20_000.0
  color = colors.sample

  CircleWave.new alpha: alpha, radius: radius, position: position, speed: speed, color: color
end

xm = RayMusic.load 'resources/chiptun1.mod'
xm.play

time_played = 0.0
pause = false

RayWindow.target_fps = 60 # Set our game to run at 60 frames-per-second

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  xm.update # Update music buffer with new stream data

  if RayKey.is_pressed? :sPACE
    xm.stop
    xm.play
  end

  if RayKey.is_pressed? RayKey::P
    pause = !pause
    pause ? xm.pause : xm.resume
  end

  # Get time_played scaled to bar dimensions
  time_played = xm.time_played / xm.time_length * (screen_w - 40)

  # Color circles animation
  circles.each do |circle|
    circle.alpha += circle.speed
    circle.radius += circle.speed * 10.0

    circle.speed *= -1 if circle.alpha > 1.0

    next unless circle.alpha <= 0.0

    circle.alpha = 0.0
    circle.radius = rand(10..40)
    circle.position.x = rand(circle.radius..screen_w - circle.radius)
    circle.position.y = rand(circle.radius..screen_h - circle.radius)
    circle.color = colors.sample
    circle.speed = rand(1..100) / 20_000.0
  end

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    circles.each do |circle|
      RayDraw.circle_v circle.position, circle.radius, circle.color.fade(circle.alpha)
    end

    # Draw time bar
    RayDraw.rectangle 20, screen_h - 20 - 12, screen_w - 40, 12, RayColor::LIGHTGRAY
    RayDraw.rectangle 20, screen_h - 20 - 12, time_played, 12, RayColor::MAROON unless time_played.nan?
    RayDraw.rectangle_lines 20, screen_h - 20 - 12, screen_w - 40, 12, RayColor::GRAY
  end
end

# De-Initialization
xm.unload             # Unload music stream buffers from RAM
RayAudioDevice.close  # Close audio device (music streaming is automatically stopped)
RayWindow.close       # Close window and OpenGL context
