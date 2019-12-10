# Copyright (c) 2019 Aldrin Martoq (@aldrinmartoq)
# Based on models_rlgl_solary_system.c Copyright (c) 2018 Ramon Santamaria (@raysan5)

require 'raylib'

screen_w = 1024
screen_h = 768

SPEED = 0.2

class Body
  attr_accessor :name, :radius, :orbit_radius, :orbit_period, :rotation_period, :color, :children, :orbit_pos, :rotation_pos, :screen_pos

  def initialize(**args)
    args.each { |key, val| send "#{key}=", val }
    self.color = RayColor[color] || color
    self.orbit_pos = self.rotation_pos = 0.0
    self.children ||= []
    self.orbit_radius ||= 0.0
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

  def draw(camera)
    RayGL.push_matrix do
      RayGL.scalef radius, radius, radius
      RayGL.begin RayGL::TRIANGLES do
        RayGL.color4ub color.r, color.g, color.b, color.a
        draw_slices
      end
      self.screen_pos = camera.world_to_screen RayVector3.new(orbit_radius, radius, 0.0)
    end

    draw_children camera
  end

  def draw_children(camera)
    children.each do |child|
      child.orbit_pos += SPEED * 360 / child.orbit_period
      RayGL.push_matrix do
        RayGL.rotatef child.orbit_pos, 0.0, 1.0, 0.0
        RayGL.translatef child.orbit_radius, 0.0, 0.0
        RayGL.rotatef(-child.orbit_pos, 0.0, 1.0, 0.0)

        child.draw camera
      end

      RayDraw.circle_3d RayVector3.new(0.0, 0.0, 0.0), child.orbit_radius, RayVector3.new(1.0, 0.0, 0.0), 90.0, child.color
    end
  end

  def draw_names
    RayDraw.text name, screen_pos.x - RayFont.measure_text(name, 10) / 2, screen_pos.y, 20, :black if screen_pos

    children.each(&:draw_names)
  end
end

RayWindow.init screen_w, screen_h, 'ruby raylib [models] example - rlgl module usage with push/pop matrix transformations'

camera = RayCamera.new  RayVector3.new(8.0, 8.0, 8.0),
                        RayVector3.new(0.0, 0.0, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        45.0,
                        :perspective

camera.mode = :free

sun     = Body.new radius: 0.2, color: :gold, name: 'sun'
moon    = Body.new radius: 0.05, orbit_radius: 0.200,  orbit_period: 24,      color: :gray,       name: 'moon'
mercury = Body.new radius: 0.05, orbit_radius: 0.396,  orbit_period: 90,      color: :gray,       name: 'mercury'
venus   = Body.new radius: 0.05, orbit_radius: 0.723,  orbit_period: 210,     color: :magenta,    name: 'venus'
earth   = Body.new radius: 0.05, orbit_radius: 1.000,  orbit_period: 365,     color: :blue,       name: 'earth'
mars    = Body.new radius: 0.05, orbit_radius: 1.523,  orbit_period: 690,     color: :red,        name: 'mars'
jupiter = Body.new radius: 0.05, orbit_radius: 5.200,  orbit_period: 4_260,   color: :brown,      name: 'jupiter'
saturn  = Body.new radius: 0.05, orbit_radius: 9.532,  orbit_period: 10_620,  color: :green,      name: 'saturn'
uranus  = Body.new radius: 0.05, orbit_radius: 19.180, orbit_period: 30_270,  color: :skyblue,    name: 'uranus'
neptune = Body.new radius: 0.05, orbit_radius: 30.056, orbit_period: 59_370,  color: :purple,     name: 'neptune'
pluto   = Body.new radius: 0.05, orbit_radius: 39.463, orbit_period: 89_310,  color: :darkgreen,  name: 'pluto'

earth.children += [moon]
sun.children += [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]

RayWindow.target_fps = 60 # Set our game to run at 60 frames-per-second

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  camera.update

  RayDraw.drawing do
    RayDraw.clear_background :white

    camera.mode3d do
      sun.draw camera

      RayDraw.grid 80, 1.0
    end

    sun.draw_names
    RayDraw.text 'FULL SOLAR SYSTEM', 400, 10, 20, :maroon
    RayDraw.fps 10, 10
  end
end

RayWindow.close # Close window and OpenGL context
