module Raylib
  class BoundingBox
    # Model drawing functions
    ray_alias_object :DrawBoundingBox, :draw # Draw bounding box (wires)
  end

  class Camera2D
    # Initialize 2D mode with custom camera (2D)
    def begin_mode2d
      Raylib.BeginMode2D self
      return unless block_given?

      yield
      self.class.end_mode2d
    end

    ray_alias_static :EndMode2D, :end_mode2d # Ends 2D mode with custom camera
  end

  class Camera3D
    # Initializes 3D mode with custom camera (3D)
    def begin_mode3d
      Raylib.BeginMode3D self
      return unless block_given?

      yield
      self.class.end_mode3d
    end

    ray_alias_static :EndMode3D, :end_mode3d # Ends 3D mode and returns to default 2D orthographic mode

    # Screen-space-related functions

    # Returns a ray trace from mouse position
    def ray(mouse_position)
      Raylib.GetMouseRay mouse_position, self
    end

    # Returns the screen space position for a 3d world space position
    def world_to_screen(cube)
      Raylib.GetWorldToScreen cube, self
    end

    ray_alias_object :GetCameraMatrix, :matrix # Returns camera transform matrix (view matrix)

    # Camera System Functions (Module: camera)
    ray_alias_object :SetCameraMode,              :mode=                # Set camera mode (multiple camera modes available)
    ray_alias_object :UpdateCamera,               :update               # Update camera position for selected mode

    ray_alias_static :SetCameraPanControl,        :pan_control=         # Set camera pan key to combine with mouse movement (free camera)
    ray_alias_static :SetCameraAltControl,        :alt_control=         # Set camera alt key to combine with mouse movement (free camera)
    ray_alias_static :SetCameraSmoothZoomControl, :smooth_zoom_control= # Set camera smooth zoom key to combine with mouse (free camera)
    ray_alias_static :SetCameraMoveControls,      :set_move_controls    # Set camera move controls (1st person and 3rd person cameras)
  end

  class Collision
    # Basic shapes collision detection functions
    ray_alias_static :CheckCollisionRecs,           :check_recs           # Check collision between two rectangles
    ray_alias_static :CheckCollisionCircles,        :check_circles        # Check collision between two circles
    ray_alias_static :CheckCollisionCircleRec,      :check_circle_rec     # Check collision between circle and rectangle
    ray_alias_static :GetCollisionRec,              :rec                  # Get collision rectangle for two rectangles collision
    ray_alias_static :CheckCollisionPointRec,       :check_point_rec      # Check if point is inside rectangle
    ray_alias_static :CheckCollisionPointCircle,    :check_point_circle   # Check if point is inside circle
    ray_alias_static :CheckCollisionPointTriangle,  :check_point_triangle # Check if point is inside a triangle

    # Collision detection functions
    ray_alias_static :CheckCollisionSpheres,        :check_spheres        # Detect collision between two spheres
    ray_alias_static :CheckCollisionBoxes,          :check_boxes          # Detect collision between two bounding boxes
    ray_alias_static :CheckCollisionBoxSphere,      :check_box_sphere     # Detect collision between box and sphere
    ray_alias_static :CheckCollisionRaySphere,      :check_ray_sphere     # Detect collision between ray and sphere
    ray_alias_static :CheckCollisionRaySphereEx,    :check_ray_sphere_ex  # Detect collision between ray and sphere, returns collision point
    ray_alias_static :CheckCollisionRayBox,         :check_ray_box        # Detect collision between ray and box
    ray_alias_static :GetCollisionRayModel,         :check_ray_model      # Get collision info between ray and model
    ray_alias_static :GetCollisionRayTriangle,      :check_ray_triangle   # Get collision info between ray and triangle
    ray_alias_static :GetCollisionRayGround,        :check_ray_ground     # Get collision info between ray and ground plane (Y-normal plane)
  end

  class Color
    # Color-related functions
    ray_alias_object :ColorToInt,     :to_i           # Returns hexadecimal value for a Color
    ray_alias_object :ColorNormalize, :to_normalized  # Returns color normalized as float [0..1]
    ray_alias_object :ColorToHSV,     :to_hsv         # Returns HSV values for a Color
    ray_alias_static :GetColor,       :from_i         # Returns a Color struct from hexadecimal value
    ray_alias_object :Fade,           :fade           # Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

    # Some Basic Colors
    # NOTE: Custom raylib color palette for amazing visuals on WHITE background
    LIGHTGRAY   = Color.new 200, 200, 200, 255    # Light Gray
    GRAY        = Color.new 130, 130, 130, 255    # Gray
    DARKGRAY    = Color.new  80,  80,  80, 255    # Dark Gray
    YELLOW      = Color.new 253, 249,   0, 255    # Yellow
    GOLD        = Color.new 255, 203,   0, 255    # Gold
    ORANGE      = Color.new 255, 161,   0, 255    # Orange
    PINK        = Color.new 255, 109, 194, 255    # Pink
    RED         = Color.new 230,  41,  55, 255    # Red
    MAROON      = Color.new 190,  33,  55, 255    # Maroon
    GREEN       = Color.new   0, 228,  48, 255    # Green
    LIME        = Color.new   0, 158,  47, 255    # Lime
    DARKGREEN   = Color.new   0, 117,  44, 255    # Dark Green
    SKYBLUE     = Color.new 102, 191, 255, 255    # Sky Blue
    BLUE        = Color.new   0, 121, 241, 255    # Blue
    DARKBLUE    = Color.new   0,  82, 172, 255    # Dark Blue
    PURPLE      = Color.new 200, 122, 255, 255    # Purple
    VIOLET      = Color.new 135,  60, 190, 255    # Violet
    DARKPURPLE  = Color.new 112,  31, 126, 255    # Dark Purple
    BEIGE       = Color.new 211, 176, 131, 255    # Beige
    BROWN       = Color.new 127, 106,  79, 255    # Brown
    DARKBROWN   = Color.new  76,  63,  47, 255    # Dark Brown

    WHITE       = Color.new 255, 255, 255, 255    # White
    BLACK       = Color.new   0,   0,   0, 255    # Black
    BLANK       = Color.new   0,   0,   0,   0    # Blank (Transparent)
    MAGENTA     = Color.new 255,   0, 255, 255    # Magenta
    RAYWHITE    = Color.new 245, 245, 245, 255    # My own White (raylib logo)
  end

  class Cursor
    # Cursor-related functions
    ray_alias_static :ShowCursor,     :show         # Shows cursor
    ray_alias_static :HideCursor,     :hide         # Hides cursor
    ray_alias_static :IsCursorHidden, :is_hidden?   # Check if cursor is not visible
    ray_alias_static :EnableCursor,   :enable       # Enables cursor (unlock cursor)
    ray_alias_static :DisableCursor,  :disable      # Disables cursor (lock cursor)
  end

  class Draw
    # Drawing-related functions
    ray_alias_static :ClearBackground,  :clear_background   # Set background color (framebuffer clear color)
    ray_alias_static :EndDrawing,       :end_drawing        # End canvas drawing and swap buffers (double buffering)

    # Setup canvas (framebuffer) to start drawing
    def self.begin_drawing
      Raylib.BeginDrawing
      return unless block_given?

      yield
      end_drawing
    end

    # Basic shapes drawing functions
    ray_alias_static :DrawPixel,                :pixel                  # Draw a pixel
    ray_alias_static :DrawPixelV,               :pixel_v                # Draw a pixel (Vector version)
    ray_alias_static :DrawLine,                 :line                   # Draw a line
    ray_alias_static :DrawLineV,                :line_v                 # Draw a line (Vector version)
    ray_alias_static :DrawLineEx,               :line_ex                # Draw a line defining thickness
    ray_alias_static :DrawLineBezier,           :line_bezier            # Draw a line using cubic-bezier curves in-out
    ray_alias_static :DrawCircle,               :circle                 # Draw a color-filled circle
    ray_alias_static :DrawCircleGradient,       :circle_gradient        # Draw a gradient-filled circle
    ray_alias_static :DrawCircleV,              :circle_v               # Draw a color-filled circle (Vector version)
    ray_alias_static :DrawCircleLines,          :circle_lines           # Draw circle outline
    ray_alias_static :DrawRectangle,            :rectangle              # Draw a color-filled rectangle
    ray_alias_static :DrawRectangleV,           :rectangle_v            # Draw a color-filled rectangle (Vector version)
    ray_alias_static :DrawRectangleGradientV,   :rectangle_gradient_v   # Draw a vertical-gradient-filled rectangle
    ray_alias_static :DrawRectangleGradientH,   :rectangle_gradient_h   # Draw a horizontal-gradient-filled rectangle
    ray_alias_static :DrawRectangleGradientEx,  :rectangle_gradient_ex  # Draw a gradient-filled rectangle with custom vertex colors
    ray_alias_static :DrawRectangleLines,       :rectangle_lines        # Draw rectangle outline
    ray_alias_static :DrawRectangleLinesEx,     :rectangle_lines_ex     # Draw rectangle outline with extended parameters
    ray_alias_static :DrawTriangle,             :triangle               # Draw a color-filled triangle
    ray_alias_static :DrawTriangleLines,        :triangle_lines         # Draw triangle outline
    ray_alias_static :DrawPoly,                 :poly                   # Draw a regular polygon (Vector version)
    ray_alias_static :DrawPolyEx,               :poly_ex                # Draw a closed polygon defined by points
    ray_alias_static :DrawPolyExLines,          :poly_ex_lines          # Draw polygon lines

    # Text drawing functions
    ray_alias_static :DrawFPS,                  :fps                    # Shows current FPS
    ray_alias_static :DrawText,                 :text                   # Draw text (using default font)
    ray_alias_static :DrawTextEx,               :text_ex                # Draw text using font and additional parameters

    # Basic geometric 3D shapes drawing functions
    ray_alias_static :DrawLine3D,               :line_3d                # Draw a line in 3D world space
    ray_alias_static :DrawCircle3D,             :circle_3d              # Draw a circle in 3D world space
    ray_alias_static :DrawCube,                 :cube                   # Draw cube
    ray_alias_static :DrawCubeV,                :cube_v                 # Draw cube (Vector version)
    ray_alias_static :DrawCubeWires,            :cube_wires             # Draw cube wires
    ray_alias_static :DrawCubeTexture,          :cube_texture           # Draw cube textured
    ray_alias_static :DrawSphere,               :sphere                 # Draw sphere
    ray_alias_static :DrawSphereEx,             :sphere_ex              # Draw sphere with extended parameters
    ray_alias_static :DrawSphereWires,          :sphere_wires           # Draw sphere wires
    ray_alias_static :DrawCylinder,             :cylinder               # Draw a cylinder/cone
    ray_alias_static :DrawCylinderWires,        :cylinder_wires         # Draw a cylinder/cone wires
    ray_alias_static :DrawPlane,                :plane                  # Draw a plane XZ
    ray_alias_static :DrawGrid,                 :grid                   # Draw a grid (centered at (0, 0, 0))
    ray_alias_static :DrawGizmo,                :gizmo                  # Draw simple gizmo

    # Model drawing functions
    ray_alias_static :DrawBillboard,            :billboard              # Draw a billboard texture
    ray_alias_static :DrawBillboardRec,         :billboard_rec          # Draw a billboard texture defined by sourceRec

    # Shading begin/end functions
    # Begin blending mode (alpha, additive, multiplied)
    def self.begin_blend_mode(mode)
      Raylib.BeginBlendMode mode
      return unless block_given?

      yield
      end_blend_mode
    end

    ray_alias_static :EndBlendMode, :end_blend_mode # End blending mode (reset to default: alpha blending)
  end

  class Font
    # Font loading/unloading functions
    ray_alias_static :GetFontDefault,           :default              # Get the default Font
    ray_alias_static :LoadFont,                 :load                 # Load font from file into GPU memory (VRAM)
    ray_alias_static :LoadFontEx,               :load_ex              # Load font from file with extended parameters
    ray_alias_static :LoadFontData,             :load_data            # Load font data for further use
    ray_alias_static :GenImageFontAtlas,        :gen_image_atlas      # Generate image font atlas using chars info
    ray_alias_object :UnloadFont,               :unload               # Unload Font from GPU memory (VRAM)

    # Text misc. functions
    ray_alias_static :MeasureText,              :measure_text         # Measure string width for default font
    ray_alias_object :MeasureTextEx,            :measure_text         # Measure string size for Font
    # FIXME: SEEMS NOT TO BE WORKING, use native ruby format() instead
    ray_alias_static :FormatText,               :format_text          # Formatting of text with variables to 'embed'
    ray_alias_static :SubText,                  :sub_text             # Get a piece of a text string
    ray_alias_object :GetGlyphIndex,            :glyph_index          # Get index position for a unicode character on font
  end

  class Gamepad
    # Input-related functions: gamepads
    ray_alias_static :IsGamepadAvailable,       :is_available?        # Detect if a gamepad is available
    ray_alias_static :IsGamepadName,            :is_name?             # Check gamepad name (if available)
    ray_alias_static :GetGamepadName,           :name                 # Return gamepad internal name id
    ray_alias_static :IsGamepadButtonPressed,   :is_button_pressed?   # Detect if a gamepad button has been pressed once
    ray_alias_static :IsGamepadButtonDown,      :is_button_down?      # Detect if a gamepad button is being pressed
    ray_alias_static :IsGamepadButtonReleased,  :is_button_released?  # Detect if a gamepad button has been released once
    ray_alias_static :IsGamepadButtonUp,        :is_button_up?        # Detect if a gamepad button is NOT being pressed
    ray_alias_static :GetGamepadButtonPressed,  :button_pressed       # Get the last gamepad button pressed
    ray_alias_static :GetGamepadAxisCount,      :axis_count           # Return gamepad axis count for a gamepad
    ray_alias_static :GetGamepadAxisMovement,   :axis_movement        # Return axis movement value for a gamepad axis
  end

  class Image
    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadImage,              :load               # Load image from file into CPU memory (RAM)
    ray_alias_static :LoadImageEx,            :load_ex            # Load image from Color array data (RGBA - 32bit)
    ray_alias_static :LoadImagePro,           :load_pro           # Load image from raw data with parameters
    ray_alias_static :LoadImageRaw,           :load_raw           # Load image from RAW file data
    ray_alias_object :ExportImage,            :export             # Export image as a PNG file
    ray_alias_object :LoadTextureFromImage,   :to_texture2d       # Load texture from image data
    ray_alias_object :UnloadImage,            :unload             # Unload image from CPU memory (RAM)
    ray_alias_object :GetImageData,           :to_data            # Get pixel data from image as a Color struct array
    ray_alias_object :GetImageDataNormalized, :to_data_normalized # Get pixel data from image as Vector4 array (float normalized)
    ray_alias_static :GetPixelDataSize,       :pixel_data_size    # Get pixel data size in bytes (image or texture)

    # Image manipulation functions
    ray_alias_object :ImageCopy,              :copy               # Create an image duplicate (useful for transformations)
    ray_alias_object :ImageToPOT,             :pot!               # Convert image to POT (power-of-two)
    ray_alias_object :ImageFormat,            :format!            # Convert image data to desired format
    ray_alias_object :ImageAlphaMask,         :alpha_mask!        # Apply alpha mask to image
    ray_alias_object :ImageAlphaClear,        :alpha_clear!       # Clear alpha channel to desired color
    ray_alias_object :ImageAlphaCrop,         :alpha_crop!        # Crop image depending on alpha value
    ray_alias_object :ImageAlphaPremultiply,  :alpha_premultiply! # Premultiply alpha channel
    ray_alias_object :ImageCrop,              :crop!              # Crop an image to a defined rectangle
    ray_alias_object :ImageResize,            :resize!            # Resize image (bilinear filtering)
    ray_alias_object :ImageResizeNN,          :resize_nn!         # Resize image (Nearest-Neighbor scaling algorithm)
    ray_alias_object :ImageResizeCanvas,      :resize_canvas!     # Resize canvas and fill with color
    ray_alias_object :ImageMipmaps,           :gen_mipmaps!       # Generate all mipmap levels for a provided image
    ray_alias_object :ImageDither,            :dither!            # Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    ray_alias_static :ImageText,              :from_text          # Create an image from text (default font)
    ray_alias_static :ImageTextEx,            :from_text_ex       # Create an image from text (custom sprite font)
    ray_alias_object :ImageDraw,              :draw!              # Draw a source image within a destination image
    ray_alias_object :ImageDrawRectangle,     :draw_rectangle!    # Draw rectangle within an image
    ray_alias_object :ImageDrawText,          :draw_text!         # Draw text (default font) within an image (destination)
    ray_alias_object :ImageDrawTextEx,        :draw_text_ex!      # Draw text (custom sprite font) within an image (destination)
    ray_alias_object :ImageFlipVertical,      :flip_vertical!     # Flip image vertically
    ray_alias_object :ImageFlipHorizontal,    :flip_horizontal!   # Flip image horizontally
    ray_alias_object :ImageRotateCW,          :rotate_cw!         # Rotate image clockwise 90deg
    ray_alias_object :ImageRotateCCW,         :rotate_ccw!        # Rotate image counter-clockwise 90deg
    ray_alias_object :ImageColorTint,         :color_tint!        # Modify image color: tint
    ray_alias_object :ImageColorInvert,       :color_invert!      # Modify image color: invert
    ray_alias_object :ImageColorGrayscale,    :color_grayscale!   # Modify image color: grayscale
    ray_alias_object :ImageColorContrast,     :color_contrast!    # Modify image color: contrast (-100 to 100)
    ray_alias_object :ImageColorBrightness,   :color_brightness!  # Modify image color: brightness (-255 to 255)
    ray_alias_object :ImageColorReplace,      :color_replace!     # Modify image color: replace color

    # Image generation functions
    ray_alias_static :GenImageColor,          :gen_color            # Generate image: plain color
    ray_alias_static :GenImageGradientV,      :gen_gradient_v       # Generate image: vertical gradient
    ray_alias_static :GenImageGradientH,      :gen_gradient_h       # Generate image: horizontal gradient
    ray_alias_static :GenImageGradientRadial, :gen_gradient_radial  # Generate image: radial gradient
    ray_alias_static :GenImageChecked,        :gen_checked          # Generate image: checked
    ray_alias_static :GenImageWhiteNoise,     :gen_white_noise      # Generate image: white noise
    ray_alias_static :GenImagePerlinNoise,    :gen_perlin_noise     # Generate image: perlin noise
    ray_alias_static :GenImageCellular,       :gen_cellular         # Generate image: cellular algorithm. Bigger tileSize means bigger cells
  end

  class Key
    # Input-related functions: keyboard
    ray_alias_static :IsKeyPressed,   :is_pressed?    # Detect if a key has been pressed once
    ray_alias_static :IsKeyDown,      :is_down?       # Detect if a key is being pressed
    ray_alias_static :IsKeyReleased,  :is_released?   # Detect if a key has been released once
    ray_alias_static :IsKeyUp,        :is_up?         # Detect if a key is NOT being pressed
    ray_alias_static :GetKeyPressed,  :key_pressed    # Get latest key pressed
    ray_alias_static :SetExitKey,     :exit_key=      # Set a custom key to exit program (default is ESC)
  end

  class Material
    # Material loading/unloading functions
    ray_alias_static :LoadMaterial,           :load                 # Load material from file
    ray_alias_static :LoadMaterialDefault,    :load_default         # Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    ray_alias_object :UnloadMaterial,         :unload               # Unload material from GPU memory (VRAM)
  end

  class Mesh
    # Model loading/unloading functions
    ray_alias_object :LoadModelFromMesh, :to_model # Load model from generated mesh

    # Mesh loading/unloading functions
    ray_alias_static :LoadMesh,               :load                 # Load mesh from file
    ray_alias_object :UnloadMesh,             :unload               # Unload mesh from memory (RAM and/or VRAM)
    ray_alias_object :ExportMesh,             :export               # Export mesh as an OBJ file

    # Mesh manipulation functions
    ray_alias_object :MeshBoundingBox,        :bounding_box         # Compute mesh bounding box limits
    ray_alias_object :MeshTangents,           :tangents             # Compute mesh tangents
    ray_alias_object :MeshBinormals,          :binormals            # Compute mesh binormals

    # Mesh generation functions
    ray_alias_static :GenMeshPlane,           :gen_plane            # Generate plane mesh (with subdivisions)
    ray_alias_static :GenMeshCube,            :gen_cube             # Generate cuboid mesh
    ray_alias_static :GenMeshSphere,          :gen_sphere           # Generate sphere mesh (standard sphere)
    ray_alias_static :GenMeshHemiSphere,      :gen_hemisphere       # Generate half-sphere mesh (no bottom cap)
    ray_alias_static :GenMeshCylinder,        :gen_cylinder         # Generate cylinder mesh
    ray_alias_static :GenMeshTorus,           :gen_torus            # Generate torus mesh
    ray_alias_static :GenMeshKnot,            :gen_knot             # Generate trefoil knot mesh
    ray_alias_static :GenMeshHeightmap,       :gen_heightmap        # Generate heightmap mesh from image data
    ray_alias_static :GenMeshCubicmap,        :gen_cubicmap         # Generate cubes-based map mesh from image data
  end

  class Model
    # Model loading/unloading functions
    ray_alias_static :LoadModel,              :load                 # Load model from files (mesh and material)
    ray_alias_object :UnloadModel,            :unload               # Unload model from memory (RAM and/or VRAM)

    # Model drawing functions
    ray_alias_object :DrawModel,              :draw                 # Draw a model (with texture if set)
    ray_alias_object :DrawModelEx,            :draw_ex              # Draw a model with extended parameters
    ray_alias_object :DrawModelWires,         :draw_wires           # Draw a model wires (with texture if set)
    ray_alias_object :DrawModelWiresEx,       :draw_wires_ex        # Draw a model wires (with texture if set) with extended parameters
  end

  class Mouse
    # Input-related functions: mouse
    ray_alias_static :IsMouseButtonPressed,   :is_button_pressed?   # Detect if a mouse button has been pressed once
    ray_alias_static :IsMouseButtonDown,      :is_button_down?      # Detect if a mouse button is being pressed
    ray_alias_static :IsMouseButtonReleased,  :is_button_released?  # Detect if a mouse button has been released once
    ray_alias_static :IsMouseButtonUp,        :is_button_up?        # Detect if a mouse button is NOT being pressed
    ray_alias_static :GetMouseX,              :x                    # Returns mouse position X
    ray_alias_static :GetMouseY,              :y                    # Returns mouse position Y
    ray_alias_static :GetMousePosition,       :position             # Returns mouse position XY
    ray_alias_static :SetMousePosition,       :position=            # Set mouse position XY
    ray_alias_static :SetMouseScale,          :scale=               # Set mouse scaling
    ray_alias_static :GetMouseWheelMove,      :wheel_move           # Returns mouse wheel movement Y
  end

  class Ray
    ray_alias_object :DrawRay,                  :draw               # Draw a ray line
  end

  class Rectangle
    # Basic shapes drawing functions
    ray_alias_object :DrawRectangleRec,         :draw               # Draw a color-filled rectangle
    ray_alias_object :DrawRectanglePro,         :draw_pro           # Draw a color-filled rectangle with pro parameters
  end

  class RenderTexture2D
    # Drawing-related functions

    # Initializes render texture for drawing
    def begin_texture_mode
      Raylib.BeginTextureMode self
      return unless block_given?

      yield
      self.class.end_texture_mode
    end

    ray_alias_static :EndTextureMode, :end_texture_mode # Ends drawing to render texture

    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadRenderTexture,      :load             # Load texture for rendering (framebuffer)
    ray_alias_object :UnloadRenderTexture,    :unload           # Unload render texture from GPU memory (VRAM)
  end

  class Shader
    # Shader loading/unloading functions
    ray_alias_static :LoadShader,             :load             # Load shader from files and bind default locations
    ray_alias_static :LoadShaderCode,         :load_code        # Load shader from code strings and bind default locations
    ray_alias_object :UnloadShader,           :unload           # Unload shader from GPU memory (VRAM)

    ray_alias_static :GetShaderDefault,       :default          # Get default shader

    # Shader configuration functions
    ray_alias_object :GetShaderLocation,      :location           # Get shader uniform location
    ray_alias_object :SetShaderValue,         :set_value          # Set shader uniform value (float)
    ray_alias_object :SetShaderValuei,        :set_valuei         # Set shader uniform value (int)
    ray_alias_object :SetShaderValueMatrix,   :set_value_matrix   # Set shader uniform value (matrix 4x4)
    ray_alias_static :SetMatrixProjection,    :matrix_projection= # Set a custom projection matrix (replaces internal projection matrix)
    ray_alias_static :SetMatrixModelview,     :matrix_modelview=  # Set a custom modelview matrix (replaces internal modelview matrix)
    ray_alias_static :GetMatrixModelview,     :matrix_modelview   # Get internal modelview matrix

    # Texture maps generation (PBR)
    # NOTE: Required shaders should be provided
    ray_alias_object :GenTextureCubemap,      :gen_texture_cubemap    # Generate cubemap texture from HDR texture
    ray_alias_object :GenTextureIrradiance,   :gen_texture_irradiance # Generate irradiance texture using cubemap data
    ray_alias_object :GenTexturePrefilter,    :gen_texture_prefilter  # Generate prefilter texture using cubemap data
    ray_alias_object :GenTextureBRDF,         :gen_texture_brdf       # Generate BRDF texture using cubemap data

    # Shading begin/end functions

    # Begin custom shader drawing
    def begin_shader_mode
      Raylib.BeginShaderMode self
      return unless block_given?

      yield
      self.class.end_shader_mode
    end

    ray_alias_static :EndShaderMode, :end_shader_mode # End custom shader drawing (use default shader)
  end

  class Texture2D
    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadTexture,            :load             # Load texture from file into GPU memory (VRAM)
    ray_alias_static :LoadTextureFromImage,   :load_from_image  # Load texture from image data
    ray_alias_object :UnloadTexture,          :unload           # Unload texture from GPU memory (VRAM)
    ray_alias_object :GetTextureData,         :to_image         # Get pixel data from GPU texture and return an Image
    ray_alias_object :UpdateTexture,          :update           # Update GPU texture with new data

    # Texture2D configuration functions
    ray_alias_object :GenTextureMipmaps,      :gen_mipmaps      # Generate GPU mipmaps for a texture
    ray_alias_object :SetTextureFilter,       :filter=          # Set texture scaling filter mode
    ray_alias_object :SetTextureWrap,         :wrap=            # Set texture wrapping mode

    # Texture2D drawing functions
    ray_alias_object :DrawTexture,            :draw             # Draw a Texture2D
    ray_alias_object :DrawTextureV,           :draw_v           # Draw a Texture2D with position defined as Vector2
    ray_alias_object :DrawTextureEx,          :draw_ex          # Draw a Texture2D with extended parameters
    ray_alias_object :DrawTextureRec,         :draw_rec         # Draw a part of a texture defined by a rectangle
    ray_alias_object :DrawTexturePro,         :draw_pro         # Draw a part of a texture defined by a rectangle with 'pro' parameters
  end

  class Touch
    # Input-related functions: touch
    ray_alias_static :GetTouchX,              :x                # Returns touch position X for touch point 0 (relative to screen size)
    ray_alias_static :GetTouchY,              :y                # Returns touch position Y for touch point 0 (relative to screen size)
    ray_alias_static :GetTouchPosition,       :position         # Returns touch position XY for a touch point index (relative to screen size)

    # Gestures and Touch Handling Functions (Module: gestures)
    ray_alias_static :SetGesturesEnabled,     :gestures=        # Enable a set of gestures using flags
    ray_alias_static :IsGestureDetected,      :is_gesture?      # Check if a gesture have been detected
    ray_alias_static :GetGestureDetected,     :gesture          # Get latest detected gesture
    ray_alias_static :GetTouchPointsCount,    :points_count     # Get touch points count
    ray_alias_static :GetGestureHoldDuration, :hold_duration    # Get gesture hold time in milliseconds
    ray_alias_static :GetGestureDragVector,   :drag_vector      # Get gesture drag vector
    ray_alias_static :GetGestureDragAngle,    :drag_angle       # Get gesture drag angle
    ray_alias_static :GetGesturePinchVector,  :pinch_vector     # Get gesture pinch delta
    ray_alias_static :GetGesturePinchAngle,   :pinch_angle      # Get gesture pinch angle

    # Shader loading/unloading functions
    ray_alias_static :GetTextureDefault,      :default # Get default texture
  end

  class VrDeviceInfo
    # VR control functions
    ray_alias_static :GetVrDeviceInfo,        :device_info              # Get VR device information for some standard devices
    ray_alias_object :InitVrSimulator,        :init_vr_simulator        # Init VR simulator for selected device parameters
    ray_alias_static :CloseVrSimulator,       :close_vr_simulator       # Close VR simulator for current device
    ray_alias_static :IsVrSimulatorReady,     :is_vr_simulator_ready?   # Detect if VR simulator is ready
    ray_alias_static :SetVrDistortionShader,  :vr_distortion_shader=    # Set VR distortion shader for stereoscopic rendering
    ray_alias_static :UpdateVrTracking,       :vr_tracking=             # Update VR tracking (position and orientation) and camera
    ray_alias_static :ToggleVrMode,           :toggle_vr_mode           # Enable/Disable VR experience
    ray_alias_static :BeginVrDrawing,         :begin_vr_drawing         # Begin VR simulator stereo rendering
    ray_alias_static :EndVrDrawing,           :end_vr_drawing           # End VR simulator stereo rendering
  end

  class Window
    # Window-related functions
    ray_alias_static :InitWindow,           :init               # Initialize window and OpenGL context
    ray_alias_static :CloseWindow,          :close              # Close window and unload OpenGL context
    ray_alias_static :IsWindowReady,        :is_ready?          # Check if window has been initialized successfully
    ray_alias_static :WindowShouldClose,    :should_close?      # Check if KEY_ESCAPE pressed or Close icon pressed
    ray_alias_static :IsWindowMinimized,    :is_minimized?      # Check if window has been minimized (or lost focus)
    ray_alias_static :ToggleFullscreen,     :toggle_fullscreen  # Toggle fullscreen mode (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowIcon,        :icon=              # Set icon for window (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowTitle,       :title=             # Set title for window (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowPosition,    :set_position       # Set window position on screen (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowMonitor,     :monitor=           # Set monitor for the current window (fullscreen mode)
    ray_alias_static :SetWindowMinSize,     :set_min_size       # Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    ray_alias_static :SetWindowSize,        :set_size           # Set window dimensions
    ray_alias_static :GetScreenWidth,       :width              # Get current screen width
    ray_alias_static :GetScreenHeight,      :height             # Get current screen height

    # Timming-related functions
    ray_alias_static :SetTargetFPS,         :target_fps=        # Set target FPS (maximum)
    ray_alias_static :GetFPS,               :fps                # Returns current FPS
    ray_alias_static :GetFrameTime,         :time_since_frame   # Returns time in seconds for last frame drawn
    ray_alias_static :GetTime,              :time_since_init    # Returns elapsed time in seconds since InitWindow()
  end

  # Misc. functions
  Raylib.singleton_class.send :alias_method, :show_logo,        :ShowLogo         # Activate raylib logo at startup (can be done with flags)
  Raylib.singleton_class.send :alias_method, :config_flags=,    :SetConfigFlags   # Setup window configuration flags (view FLAGS)
  Raylib.singleton_class.send :alias_method, :trace_log=,       :SetTraceLog      # Enable trace log message types (bit flags based)
  Raylib.singleton_class.send :alias_method, :trace_log,        :TraceLog         # Show trace log messages (LOG_INFO, LOG_WARNING, LOG_ERROR, LOG_DEBUG)
  Raylib.singleton_class.send :alias_method, :take_screenshot,  :TakeScreenshot   # Takes a screenshot of current screen (saved a .png)
  Raylib.singleton_class.send :alias_method, :random_value,     :GetRandomValue   # Returns a random value between min and max (both included)

  # Files management functions
  Raylib.singleton_class.send :alias_method, :is_file_extension?,     :IsFileExtension      # Check file extension
  Raylib.singleton_class.send :alias_method, :get_extension,          :GetExtension         # Get pointer to extension for a filename string
  Raylib.singleton_class.send :alias_method, :get_file_name,          :GetFileName          # Get pointer to filename for a path string
  Raylib.singleton_class.send :alias_method, :get_directory_path,     :GetDirectoryPath     # Get full path for a given fileName (uses static string)
  Raylib.singleton_class.send :alias_method, :get_working_directory,  :GetWorkingDirectory  # Get current working directory (uses static string)
  Raylib.singleton_class.send :alias_method, :change_directory,       :ChangeDirectory      # Change working directory, returns true if success
  Raylib.singleton_class.send :alias_method, :is_file_dropped?,       :IsFileDropped        # Check if a file has been dropped into window
  Raylib.singleton_class.send :alias_method, :get_dropped_files,      :GetDroppedFiles      # Get dropped files names
  Raylib.singleton_class.send :alias_method, :clear_dropped_files,    :ClearDroppedFiles    # Clear dropped files paths buffer

  # Persistent storage management
  Raylib.singleton_class.send :alias_method, :storage_save_value,     :StorageSaveValue     # Save integer value to storage file (to defined position)
  Raylib.singleton_class.send :alias_method, :storage_load_value,     :StorageLoadValue     # Load integer value from storage file (from defined position)

  # Shader loading/unloading functions
  Raylib.singleton_class.send :alias_method, :load_text,              :LoadText # Load chars array from text file
end
