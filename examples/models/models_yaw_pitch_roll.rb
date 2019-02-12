require 'raylib'

def draw_angle_gauge(angle_gauge, x, y, angle, title, color)
  src_rec = RayRectangle.new 0, 0, angle_gauge.width, angle_gauge.height
  dst_rec = RayRectangle.new x, y, angle_gauge.width, angle_gauge.height
  origin = RayVector2.new angle_gauge.width / 2, angle_gauge.height / 2
  text_size = 20
  text = format('%5.1f', angle)

  angle_gauge.draw_pro src_rec, dst_rec, origin, angle, color

  RayDraw.text text, x - RayFont.measure_text(text, text_size) / 2, y + 10, text_size, RayColor::DARKGRAY
  RayDraw.text title, x - RayFont.measure_text(title, text_size) / 2, y + 60, text_size, RayColor::DARKGRAY
end

screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [models] example - plane rotations (yaw, pitch, roll)'

tex_angle = RayTexture2D.load 'resources/angle_gauge.png'
tex_backg = RayTexture2D.load 'resources/background.png'
tex_pitch = RayTexture2D.load 'resources/pitch.png'
tex_plane = RayTexture2D.load 'resources/plane.png'

frame_buf = RayRenderTexture2D.load 192, 192

model = RayModel.load 'resources/plane.obj'
plane_diffuse = model.material.maps[RayMaterialMap::DIFFUSE].texture = RayTexture2D.load 'resources/plane_diffuse.png'

plane_diffuse.gen_mipmaps

camera = RayCamera.new  RayVector3.new(0.0, 60.0, -120.0),
                        RayVector3.new(0.0, 12.0, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        30.0,
                        RayCamera::TYPE_PERSPECTIVE

pitch = roll = yaw = 0.0

RayWindow.target_fps = 30

until RayWindow.should_close?
  if RayKey.is_down? RayKey::LEFT
    roll += 1.0
  elsif RayKey.is_down? RayKey::RIGHT
    roll -= 1.0
  else
    roll -= 0.5 if roll > 0.0
    roll += 0.5 if roll < 0.0
  end

  RayWindow.toggle_fullscreen if RayKey.is_down? RayKey::F

  if RayKey.is_down? RayKey::D
    yaw += 1.0
  elsif RayKey.is_down? RayKey::A
    yaw -= 1.0
  else
    yaw -= 0.5 if yaw > 0.0
    yaw += 0.5 if yaw < 0.0
  end

  if RayKey.is_down? RayKey::DOWN
    pitch += 0.6
  elsif RayKey.is_down? RayKey::UP
    pitch -= 0.6
  else
    pitch -= 0.3 if pitch > 0.0
    pitch += 0.3 if pitch < -0.0
  end

  pitch_offset = pitch
  pitch_offset -= 360 while pitch_offset > 180
  pitch_offset += 360 while pitch_offset < -180
  pitch_offset *= 10

  transform  = RayMatrix.identity
  transform *= RayMatrix.identity.rotate_z Raylib::DEG2RAD * roll
  transform *= RayMatrix.identity.rotate_x Raylib::DEG2RAD * pitch
  transform *= RayMatrix.identity.rotate_y Raylib::DEG2RAD * yaw

  model.transform = transform

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::RAYWHITE

    center_x = frame_buf.texture.width / 2
    center_y = frame_buf.texture.height / 2
    scale_factor = 0.5

    frame_buf.begin_texture_mode do
      RayDraw.begin_blend_mode RayDraw::BLEND_ALPHA do
        tex_backg.draw_pro  RayRectangle.new(0, 0, tex_backg.width, tex_backg.height),
                            RayRectangle.new(center_x, center_y, tex_backg.width * scale_factor, tex_backg.height * scale_factor),
                            RayVector2.new(tex_backg.width / 2 * scale_factor, tex_backg.height / 2 * scale_factor + pitch_offset * scale_factor),
                            roll,
                            RayColor::WHITE
        tex_pitch.draw_pro  RayRectangle.new(0, 0, tex_pitch.width, tex_pitch.height),
                            RayRectangle.new(center_x, center_y, tex_pitch.width * scale_factor, tex_pitch.height * scale_factor),
                            RayVector2.new(tex_pitch.width / 2 * scale_factor, tex_pitch.height / 2 * scale_factor + pitch_offset * scale_factor),
                            roll,
                            RayColor::WHITE
        tex_plane.draw_pro  RayRectangle.new(0, 0, tex_plane.width, tex_plane.height),
                            RayRectangle.new(center_x, center_y, tex_plane.width * scale_factor, tex_plane.height * scale_factor),
                            RayVector2.new(tex_plane.width / 2 * scale_factor, tex_plane.height / 2 * scale_factor + pitch_offset * scale_factor),
                            0,
                            RayColor::WHITE
      end
    end

    camera.begin_mode3d do
      model.draw RayVector3.new(0, 6.0, 0), 1.0, RayColor::WHITE
      RayDraw.grid 10, 10.0
    end

    draw_angle_gauge tex_angle, 80, 70, roll, 'roll', RayColor::RED
    draw_angle_gauge tex_angle, 190, 70, pitch, 'pitch', RayColor::GREEN
    draw_angle_gauge tex_angle, 300, 70, yaw, 'yaw', RayColor::SKYBLUE

    frame_buf.texture.draw_rec  RayRectangle.new(0, 0, frame_buf.texture.width, -frame_buf.texture.height),
                                RayVector2.new(screen_w - frame_buf.texture.width - 20, 20),
                                RayColor::WHITE.fade(0.8)

    RayDraw.fps 0, 0
  end
end

model.unload
frame_buf.unload
tex_backg.unload
tex_pitch.unload
tex_plane.unload
RayWindow.close
