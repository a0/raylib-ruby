# /*******************************************************************************************
# *
# *   raylib [textures] example - Image processing
# *
# *   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
# *
# *   This example has been created using raylib 1.4 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2016 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Required for: free()
module C
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :free, [:pointer], :void
end

NUM_PROCESSES = 8

processes = %i[no_processing color_grayscale! color_tint! color_invert! color_contrast! color_brightness! flip_vertical! flip_horizontal!]
texts = processes.map(&:to_s).map(&:upcase)

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] example - image processing'

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)

image = RayImage.load 'resources/parrots.png'   # Loaded in CPU memory (RAM)
image.format! :uncompressed_r8g8b8a8            # Format image to RGBA 32bit (required for texture update) <-- ISSUE
texture = image.to_texture2d                    # Image converted to texture, GPU memory (VRAM)

current_process = 1
texture_reload  = false

rectangles = Array.new(NUM_PROCESSES) { |index| RayRectangle.new 40, 50 + 32 * index, 150, 30 }

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  if RayKey.pressed? :down
    current_process += 1
    current_process = 0 if current_process > 7
    texture_reload = true
  elsif RayKey.pressed? :up
    current_process -= 1
    current_process = 7 if current_process.negative?
    texture_reload = true
  end

  process = processes[current_process]

  if texture_reload
    image.unload                                  # Unload current image data
    image = RayImage.load 'resources/parrots.png' # Re-load image data

    # NOTE: Image processing is a costly CPU process to be done every frame,
    # If image processing is required in a frame-basis, it should be done
    # with a texture and by shaders

    if %i[color_grayscale! color_invert! flip_vertical! flip_horizontal!].include? process
      image.send process
    elsif process == :color_tint!
      image.color_tint! :green
    elsif process == :color_contrast!
      image.color_contrast!(-40)
    elsif process == :color_brightness!
      image.color_brightness!(-80)
    end

    pixels = image.to_data
    texture.update pixels
    # C.free pixels

    texture_reload = false
  end

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :raywhite

    RayDraw.text 'IMAGE PROCESSING:', 40, 30, 10, :darkgray

    # Draw Rectangles
    (0...NUM_PROCESSES).each do |index|
      rectangle = rectangles[index]
      rectangle.draw index == current_process ? :skyblue : :lightgray
      RayDraw.rectangle_lines rectangle.x, rectangle.y, rectangle.width, rectangle.height, index == current_process ? :blue : :gray
      RayDraw.text texts[index], rectangle.x + rectangle.width / 2 - RayFont.measure_text(texts[index], 10) / 2, rectangle.y + 11, 10, index == current_process ? :darkblue : :darkgray
    end

    texture.draw screen_w - texture.width - 60, screen_h / 2 - texture.height / 2, :white
    RayDraw.rectangle_lines screen_w - texture.width - 60, screen_h / 2 - texture.height / 2, texture.width, texture.height, :black
  end
end

# De-Initialization
texture.unload  # Texture unloading
RayWindow.close # Close window and OpenGL context
