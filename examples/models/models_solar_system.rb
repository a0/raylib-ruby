# Copyright (c) 2019 Aldrin Martoq (@aldrinmartoq)

require 'raylib'

screen_w = 1024
screen_h = 768

SPEED = 0.2

class Body
  attr_accessor :name, :radius, :orbit_radius, :orbit_period, :rotation_period, :color, :children, :orbit_pos, :rotation_pos, :screen_pos, :texture

  def initialize(**args)
    self.orbit_pos ||= 0.0
    self.rotation_pos ||= 0.0
    self.children ||= []
    self.orbit_radius ||= 0.0
    args.each do |key, val|
      send "#{key}=", val
    end
    self.texture = RayTexture2D.load "resources/solar_system/#{texture}.png" if texture
    self.radius *= 20
    self.orbit_radius *= 20
  end

  def draw(camera)
    model.draw RayVector3.new(0.0, 0.0, 0.0), radius, RayColor::WHITE

    self.screen_pos = camera.world_to_screen RayVector3.new(orbit_radius, radius, 0.0)

    children.each do |child|
      child.orbit_pos += SPEED * 360 / child.orbit_period

      RayGL.push_matrix do
        RayGL.rotatef child.orbit_pos, 0.0, 1.0, 0.0
        RayGL.translatef child.orbit_radius, 0.0, 0.0
        RayGL.rotatef(-child.orbit_pos, 0.0, 1.0, 0.0)

        child.draw camera
      end

      RayDraw.circle_3d RayVector3.new(0.0, 0.0, 0.0), child.orbit_radius, RayVector3.new(1.0, 0.0, 0.0), 90.0, RayColor::GRAY
    end
  end

  def draw_names
    RayDraw.text name, screen_pos.x - RayFont.measure_text(name, 10) / 2, screen_pos.y, 20, RayColor::WHITE if screen_pos

    children.each(&:draw_names)
  end

  def model
    return @model if defined? @model

    @model = RayModel.load 'resources/solar_system/sphere.obj'
    if texture
      diffuse = @model.materials[0].maps[RayMaterialMap::DIFFUSE].texture = texture
      diffuse.gen_mipmaps
    end

    @model
  end
end

RayWindow.init screen_w, screen_h, 'full solar system'

camera = RayCamera.new  RayVector3.new(16.0, 16.0, 16.0),
                        RayVector3.new(0.0, 0.0, 0.0),
                        RayVector3.new(0.0, 5.0, 0.0),
                        45.0,
                        RayCamera::TYPE_PERSPECTIVE

camera.mode = RayCamera::MODE_FREE

sun     = Body.new radius: 0.2, name: 'sun', texture: '2k_sun'
moon    = Body.new radius: 0.05, orbit_radius: 0.200,  orbit_period: 24,      name: 'moon',     texture: '2k_moon'
mercury = Body.new radius: 0.05, orbit_radius: 0.396,  orbit_period: 90,      name: 'mercury',  texture: '2k_mercury'
venus   = Body.new radius: 0.05, orbit_radius: 0.723,  orbit_period: 210,     name: 'venus',    texture: '2k_venus_atmosphere'
earth   = Body.new radius: 0.05, orbit_radius: 1.000,  orbit_period: 365,     name: 'earth',    texture: '2k_earth_daymap'
mars    = Body.new radius: 0.05, orbit_radius: 1.523,  orbit_period: 690,     name: 'mars',     texture: '2k_mars'
jupiter = Body.new radius: 0.05, orbit_radius: 5.200,  orbit_period: 4_260,   name: 'jupiter',  texture: '2k_jupiter'
saturn  = Body.new radius: 0.05, orbit_radius: 9.532,  orbit_period: 10_620,  name: 'saturn',   texture: '2k_saturn'
uranus  = Body.new radius: 0.05, orbit_radius: 19.180, orbit_period: 30_270,  name: 'uranus',   texture: '2k_uranus'
neptune = Body.new radius: 0.05, orbit_radius: 30.056, orbit_period: 59_370,  name: 'neptune',  texture: '2k_neptune'
pluto   = Body.new radius: 0.05, orbit_radius: 39.463, orbit_period: 89_310,  name: 'pluto',    texture: '2k_eris_fictional'

earth.children += [moon]
earth.children = []
sun.children += [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]
sun.children = [earth]

RayWindow.target_fps = 60

until RayWindow.should_close?
  camera.update

  RayWindow.toggle_fullscreen if RayKey.is_down? RayKey::F

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::BLACK

    camera.begin_mode3d do
      sun.draw camera

      RayDraw.grid 80.0, 1.0
    end

    sun.draw_names

    RayDraw.text 'FULL SOLAR SYSTEM', 400, 10, 20, RayColor::YELLOW
    camera_str = "\nposition: #{camera.position}\ntarget: #{camera.target}\nup: #{camera.up}"
    RayDraw.text "Camera #{camera_str}", 10, 50, 20, RayColor::WHITE
    RayDraw.fps 10, 10
  end
end
