# Copyright (c) 2019 Aldrin Martoq (@aldrinmartoq)
# Based on models_rlgl_solary_system.c Copyright (c) 2018 Ramon Santamaria (@raysan5)

require 'raylib'

screen_w = 1024
screen_h = 768

SPEED = 0.2

Body = Struct.new :name, :radius, :aphelion, :orbit_period, :rotation_period, :color, :children, :orbit_pos, :rotation_pos, keyword_init: true do
  def initialize(*)
    super
    self.orbit_pos = self.rotation_pos = 0.0
    self.children ||= []
    self.radius /= 10
    self.aphelion *= 5 if aphelion
    puts "radius: #{radius} aphelion: #{aphelion}"
  end

  def draw_slices # rubocop:disable Metrics/AbcSize
    deg2rad = Raylib::DEG2RAD
    rings = 16
    slices = 16
    (rings + 2).times do |i|
      k = i + 1
      slices.times do |j|
        l = j + 1
        RayGL.vertex3f  Math.cos(deg2rad * (270 + (180 / (rings + 1)) * i)) * Math.sin(deg2rad * (j * 360 / slices)),
                        Math.sin(deg2rad * (270 + (180 / (rings + 1)) * i)),
                        Math.cos(deg2rad * (270 + (180 / (rings + 1)) * i)) * Math.cos(deg2rad * (j * 360 / slices))
        RayGL.vertex3f  Math.cos(deg2rad * (270 + (180 / (rings + 1)) * k)) * Math.sin(deg2rad * (l * 360 / slices)),
                        Math.sin(deg2rad * (270 + (180 / (rings + 1)) * k)),
                        Math.cos(deg2rad * (270 + (180 / (rings + 1)) * k)) * Math.cos(deg2rad * (l * 360 / slices))
        RayGL.vertex3f  Math.cos(deg2rad * (270 + (180 / (rings + 1)) * k)) * Math.sin(deg2rad * (j * 360 / slices)),
                        Math.sin(deg2rad * (270 + (180 / (rings + 1)) * k)),
                        Math.cos(deg2rad * (270 + (180 / (rings + 1)) * k)) * Math.cos(deg2rad * (j * 360 / slices))

        RayGL.vertex3f  Math.cos(deg2rad * (270 + (180 / (rings + 1)) * i)) * Math.sin(deg2rad * (j * 360 / slices)),
                        Math.sin(deg2rad * (270 + (180 / (rings + 1)) * i)),
                        Math.cos(deg2rad * (270 + (180 / (rings + 1)) * i)) * Math.cos(deg2rad * (j * 360 / slices))
        RayGL.vertex3f  Math.cos(deg2rad * (270 + (180 / (rings + 1)) * i)) * Math.sin(deg2rad * (l * 360 / slices)),
                        Math.sin(deg2rad * (270 + (180 / (rings + 1)) * i)),
                        Math.cos(deg2rad * (270 + (180 / (rings + 1)) * i)) * Math.cos(deg2rad * (l * 360 / slices))
        RayGL.vertex3f  Math.cos(deg2rad * (270 + (180 / (rings + 1)) * k)) * Math.sin(deg2rad * (l * 360 / slices)),
                        Math.sin(deg2rad * (270 + (180 / (rings + 1)) * k)),
                        Math.cos(deg2rad * (270 + (180 / (rings + 1)) * k)) * Math.cos(deg2rad * (l * 360 / slices))
      end
    end
  end

  def draw
    RayGL.push_matrix do
      RayGL.scalef radius, radius, radius
      RayGL.begin RayGL::TRIANGLES do
        RayGL.color4ub color.r, color.g, color.b, color.a
        draw_slices
      end
    end

    draw_children
  end

  def draw_children
    children.each do |child|
      child.orbit_pos += SPEED * 360 / child.orbit_period
      RayGL.push_matrix do
        RayGL.rotatef child.orbit_pos, 0.0, 1.0, 0.0
        RayGL.translatef child.aphelion, 0.0, 0.0
        RayGL.rotatef(-child.orbit_pos, 0.0, 1.0, 0.0)

        child.draw
      end

      RayDraw.circle_3d RayVector3.new(0.0, 0.0, 0.0), child.aphelion, RayVector3.new(1.0, 0.0, 0.0), 90.0, RayColor::RED
    end
  end
end

moon = Body.new radius: 0.5, aphelion: 0.2, orbit_period: 24, color: RayColor::GRAY, name: 'moon'
earth = Body.new radius: 1.0, aphelion: 1.0, orbit_period: 365, color: RayColor::BLUE, name: 'earth', children: [moon]
sun = Body.new radius: 109.0 / 10, color: RayColor::GOLD, name: 'sun', children: [earth]

RayWindow.init screen_w, screen_h, 'ruby raylib [models] example - rlgl module usage with push/pop matrix transformations'

camera = RayCamera.new  RayVector3.new(16.0, 16.0, 16.0),
                        RayVector3.new(0.0, 0.0, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        45.0,
                        RayCamera::TYPE_PERSPECTIVE

camera.mode = RayCamera::MODE_FREE

RayWindow.target_fps = 60 # Set our game to run at 60 frames-per-second

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  camera.update

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      sun.draw

      RayDraw.grid 20, 1.0
    end

    RayDraw.text 'FULL SOLAR SYSTEM', 400, 10, 20, RayColor::MAROON
    RayDraw.fps 10, 10
  end
end

RayWindow.close # Close window and OpenGL context
