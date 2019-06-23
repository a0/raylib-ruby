# /*******************************************************************************************
# *
# *   raylib [audio] example - Raw audio streaming
# *
# *   NOTE: This example requires OpenAL Soft library installed
# *
# *   This example has been created using raylib 1.6 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2015 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

MAX_SAMPLES            = 22_050
MAX_SAMPLES_PER_UPDATE = 4096

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [audio] example - raw audio streaming'

RayAudioDevice.init # Initialize audio device

# Init raw audio stream (sample rate: 22050, sample size: 16bit-short, channels: 1-mono)
stream = RayAudioStream.create 22_050, 16, 1

# Generate samples data from sine wave
data = FFI::MemoryPointer.new :int16, MAX_SAMPLES
(0...MAX_SAMPLES).each do |i|
  data[i].write :int16, (Math.sin((2 * Raylib::PI * i / 2) * Raylib::DEG2RAD) * 32_000).to_i
end

stream.play # Start processing stream buffer (no data loaded currently)

total_samples = MAX_SAMPLES
samples_left = total_samples

position = RayVector2.new 0, 0

RayWindow.target_fps = 30 # Set our game to run at 30 frames-per-second

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update

  # Refill audio stream if required
  # NOTE: Every update we check if stream data has been already consumed and we update
  # buffer with new data from the generated samples, we upload data at a rate (MAX_SAMPLES_PER_UPDATE),
  # but notice that at some point we update < MAX_SAMPLES_PER_UPDATE data...
  if stream.is_buffer_processed?
    num_samples = 0
    puts "ok #{samples_left}"

    num_samples = samples_left >= MAX_SAMPLES_PER_UPDATE ? MAX_SAMPLES_PER_UPDATE : samples_left

    stream.update data + 2 * (total_samples - samples_left), num_samples
    samples_left -= num_samples

    if samples_left <= 0
      samples_left = total_samples
      puts 'done'
    end
  end

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    RayDraw.text 'SINE WAVE SHOULD BE PLAYING!', 240, 140, 20, RayColor::LIGHTGRAY

    # Draw a part of the sine wave (only screen width, proportional values)
    (0...screen_w).each do |i|
      position.x = i
      position.y = 250 + 50 * data[i].read(:int16) / 32_000

      RayDraw.pixel_v position, RayColor::RED
    end
  end
end

# De-Initialization
data.free             # Unload sine wave data (NOTE: Not required, FFI::MemoryPointer automatically does this for us)
stream.close          # Close raw audio stream and delete buffers from RAM
RayAudioDevice.close  # Close audio device (music streaming is automatically stopped)
RayWindow.close       # Close window and OpenGL context
