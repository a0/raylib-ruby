# /*******************************************************************************************
# *
# *   raylib [models] example - PBR material
# *
# *   This example has been created using raylib 1.8 (www.raylib.com)
# *   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
# *
# *   Copyright (c) 2017 Ramon Santamaria (@raysan5)
# *
# ********************************************************************************************/
# Ported to ruby by Aldrin Martoq (@aldrinmartoq)

require 'raylib'

CUBEMAP_SIZE      = 512     # Cubemap texture size
IRRADIANCE_SIZE   =  32     # Irradiance texture size
PREFILTERED_SIZE  = 256     # Prefiltered HDR environment texture size
BRDF_SIZE         = 512     # BRDF LUT texture size

def load_material_pbr(albedo, metalness, roughness)
  mat = RayMaterial.new

  path_pbr_vs = 'resources/shaders/pbr.vs'
  path_pbr_fs = 'resources/shaders/pbr.fs'

  mat.shader = RayShader.load path_pbr_vs, path_pbr_fs

  mat.shader.locs[RayShader::LOC_MAP_ALBEDO] = mat.shader.location 'albedo.sampler'

  mat.maps[RayMaterial::MAP_ALBEDO].texture = RayTexture.load 'resources/pbr/trooper_albedo.png'

  # Set up material properties color
  mat.maps[RayMaterial::MAP_ALBEDO].color = albedo
  mat.maps[RayMaterial::MAP_NORMAL].color = RayColor.new 128, 128, 255, 255
  mat
end

# Initialization
screen_w = 800
screen_h = 450

# Enable Multi Sampling Anti Aliasing 4x (if available)
Raylib.config_flags = Raylib::FLAG_MSAA_4X_HINT
RayWindow.init screen_w, screen_h, 'ruby raylib [models] example - pbr material'

# Define the camera to look into our 3d world
camera = RayCamera.new  RayVector3.new(4.0, 4.0, 4.0),    # Camera position
                        RayVector3.new(0.0, 0.5, 0.0),    # Camera looking at point
                        RayVector3.new(0.0, 1.0, 0.0),    # Camera up vector (rotation towards target)
                        45.0,                             # Camera field-of-view Y
                        RayCamera::TYPE_PERSPECTIVE       # Camera mode type

# Load model and PBR material
model = RayModel.load 'resources/pbr/trooper.obj'
model.mesh.tangents
model.material = load_material_pbr RayColor.new(255, 255, 255, 255), 1.0, 1.0

# Define lights attributes
# NOTE: Shader is passed to every light on creation to define shader bindings internally
# TODO

# Set an orbital camera mode
camera.mode = RayCamera::MODE_ORBITAL

# Set our game to run at 60 frames-per-second
RayWindow.target_fps = 60

# Main game loop
until RayWindow.should_close? # Detect window close button or ESC key
  # Update
  camera.update # Update camera

  # Draw
  RayDraw.begin_drawing do
    RayDraw.clear_background RayColor::WHITE

    camera.begin_mode3d do
      model.draw RayVector3.zero, 1.0, RayColor::WHITE

      RayDraw.grid 10, 1.0
    end

    RayDraw.fps 10, 10
  end
end

# De-Initialization
model.unload    # Unload skybox model
RayWindow.close # Close window and OpenGL context
