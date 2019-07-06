# /*******************************************************************************************
# *
# *   raylib [models] example - first person maze
# *
# *   This example has been created using raylib 2.5 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2019 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [models] example - first person maze'

# Define the camera to look into our 3d world
camera = RayCamera.new  RayVector3.new(0.2, 0.4, 0.2),
                        RayVector3.new(0.0, 0.0, 0.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        45.0,
                        RayCamera::TYPE_PERSPECTIVE

image_map = RayImage.load 'resources/cubicmap.png' # Load cubicmap image (RAM)
cubic_map = RayTexture2D.load_from_image image_map # Convert image to texture to display (VRAM)
mesh = RayMesh.gen_cubicmap image_map, RayVector3.new(1.0, 1.0, 1.0)
model = mesh.to_model

# NOTE: By default each cube is mapped to one part of texture atlas
texture = RayTexture2D.load 'resources/cubicmap_atlas.png'          # Load map texture
model.materials[0].maps[RayMaterial::MAP_DIFFUSE].texture = texture # Set map diffuse texture

# Get map image data to be used for collision detection
map_pixels = image_map.to_data
map = {}
(0...cubic_map.height).each do |y|
  (0...cubic_map.width).each do |x|
    color = RayColor.new map_pixels + (y * cubic_map.width + x) * RayColor.size
    map[[x, y]] = true if color.r == 255
  end
end

image_map.unload # Unload image from RAM

map_position = RayVector3.new(-16.0, 0.0, -8.0) # Set model position
player_position = camera.position               # Set player position
camera.mode = RayCamera::MODE_FIRST_PERSON      # Set camera mode

RayWindow.target_fps = 60                       # Set our game to run at 60 frames-per-second

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  old_cam_pos = RayVector3.new camera.position.x, camera.position.y, camera.position.z # Store old camera position
  camera.update # Update camera

  # Check player collision (we simplify to 2D collision detection)
  player_position = RayVector2.new camera.position.x, camera.position.z
  player_radius = 0.1

  player_cell_x = (player_position.x - map_position.x + 0.5).to_i
  player_cell_y = (player_position.y - map_position.z + 0.5).to_i

  # Out-of-limits security check
  player_cell_x = 0 if player_cell_x.negative?
  player_cell_x = cubic_map.width - 1 if player_cell_x >= cubic_map.width

  player_cell_y = 0 if player_cell_y.negative?
  player_cell_y = cubic_map.height - 1 if player_cell_y >= cubic_map.height

  # Check map collisions using image data and player position
  # TODO: Improvement: Just check player surrounding cells for collision
  (0...cubic_map.height).each do |y|
    (0...cubic_map.width).each do |x|
      collision_rectangle = RayRectangle.new(map_position.x - 0.5 + x * 1.0, map_position.z - 0.5 + y * 1.0, 1.0, 1.0)

      camera.position = old_cam_pos if map[[x, y]] && RayCollision.check_circle_rec(player_position, player_radius, collision_rectangle)
    end
  end

  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      model.draw map_position, 1.0, RayColor::WHITE
    end

    cubic_map.draw_ex RayVector2.new(RayWindow.width - cubic_map.width * 4 - 20, 20), 0.0, 4.0, RayColor::WHITE
    RayDraw.rectangle_lines RayWindow.width - cubic_map.width * 4 - 20, 20, cubic_map.width * 4, cubic_map.height * 4, RayColor::GREEN

    RayDraw.rectangle RayWindow.width - cubic_map.width * 4 - 20 + player_cell_x * 4, 20 + player_cell_y * 4, 4, 4, RayColor::RED
    RayDraw.fps 10, 10
  end
end

# De-Initialization
cubic_map.unload  # Unload cubicmap texture
texture.unload    # Unload map texture
model.unload      # Unload map model

RayWindow.close   # Close window and OpenGL context
