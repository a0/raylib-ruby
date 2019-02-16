# /*******************************************************************************************
# *
# *   raylib example - particles blending
# *
# *   This example has been created using raylib 1.7 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2017 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'
require 'ostruct'

MAX_PARTICLES = 200

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [textures] example - particles blending'

# Particles pool, reuse them!
mouse_tail = Array.new(MAX_PARTICLES) do
  # Initialize particles
  position = RayVector2.new 0, 0
  color = RayColor.new rand(0..255), rand(0..255), rand(0..255), 255
  alpha = 1.0
  size = rand(1..30) / 20.0
  rotation = rand 0..360
  active = false

  OpenStruct.new position: position, color: color, alpha: alpha, size: size, rotation: rotation, active: active
end

gravity = 3.0

smoke = RayTexture.load 'resources/smoke.png'

blending = RayDraw::BLEND_ALPHA

RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update

  # Activate one particle every frame and Update active particles
  # NOTE: Particles initial position should be mouse position when activated
  # NOTE: Particles fall down with gravity and rotation... and disappear after 2 seconds (alpha = 0)
  # NOTE: When a particle disappears, active = false and it can be reused.
  mouse_tail.each do |tail|
    next if tail.active

    tail.active = true
    tail.alpha = 1.0
    tail.position = RayMouse.position

    break
  end

  mouse_tail.each do |tail|
    next unless tail.active

    tail.position.y += gravity
    tail.alpha -= 0.01
    tail.active = false if tail.alpha <= 0.0
    tail.rotation += 5.0
  end

  if RayKey.is_pressed? RayKey::SPACE
    blending = blending == RayDraw::BLEND_ALPHA ? RayDraw::BLEND_ADDITIVE : RayDraw::BLEND_ALPHA
  end

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::DARKGRAY

    RayDraw.begin_blend_mode blending do
      # Draw active particles
      mouse_tail.each do |tail|
        next unless tail.active

        smoke.draw_pro  RayRectangle.new(0, 0, smoke.width, smoke.height),
                        RayRectangle.new(tail.position.x, tail.position.y, smoke.width * tail.size, smoke.height * tail.size),
                        RayVector2.new(smoke.width * tail.size / 2, smoke.height * tail.size / 2),
                        tail.rotation,
                        tail.color.fade(tail.alpha)
      end
    end

    RayDraw.text 'PRESS SPACE to CHANGE BLENDING MODE', 180, 20, 20, RayColor::BLACK

    if blending == RayDraw::BLEND_ALPHA
      RayDraw.text 'ALPHA BLENDING', 290, screen_h - 40, 20, RayColor::BLACK
    else
      RayDraw.text 'ADDITIVE BLENDING', 280, screen_h - 40, 20, RayColor::RAYWHITE
    end
  end
end

# De-Initialization
smoke.unload
RayWindow.close # Close window and OpenGL context
