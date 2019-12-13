# /*******************************************************************************************
# *
# *   raylib [models] example - Skybox loading and drawing
# *
# *   This example has been created using raylib 1.8 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2017 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

# Initialization
screen_w = 800
screen_h = 450

RayWindow.init screen_w, screen_h, 'ruby raylib [models] example - skybox loading and drawing'

camera = RayCamera.new  RayVector3.new(1.0, 1.0, 1.0),
                        RayVector3.new(4.0, 1.0, 4.0),
                        RayVector3.new(0.0, 1.0, 0.0),
                        45.0,
                        :perspective

cube = RayMesh.cube 1.0, 1.0, 1.0
skybox = cube.to_model

skybox.materials[0].shader = shader = RayShader.load 'resources/shaders/glsl330/skybox.vs', 'resources/shaders/glsl330/skybox.fs'
shader.set_value shader.location('environmentMap'), RayIntPtr.new(RayMaterialMapType[:cubemap]), 4

shader_cubemap = RayShader.load 'resources/shaders/glsl330/cubemap.vs', 'resources/shaders/glsl330/cubemap.fs'
shader_cubemap.set_value shader.location('equirectangularMap'), RayIntPtr.new(0), 4

tex_hdr = RayTexture2D.load 'resources/dresden_square.hdr'
skybox.materials[0].maps[RayMaterialMapType[:cubemap]].texture = shader_cubemap.texture_cubemap tex_hdr, 512
# FIXME: Add pending code

camera.mode = :first_person      # Set a first person camera mode

RayWindow.target_fps = 60                       # Set our game to run at 60 frames-per-second

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  camera.update # Update camera

  # Draw
  RayDraw.drawing do
    RayDraw.clear_background :raywhite

    camera.mode3d do
      skybox.draw RayVector3.new(0.0, 0.0, 0.0), 1.0, :white

      RayDraw.grid 10, 1.0
    end

    RayDraw.fps 10, 10
  end
end

skybox.unload     # Unload skybox model (and textures)
RayWindow.close   # Close window and OpenGL context
