module Raylib # rubocop:disable Metrics/ModuleLength Metrics/LineLength
  #####################################################################################
  # raylib.h
  #####################################################################################

  #------------------------------------------------------------------------------------
  # Window and Graphics Device Functions (Module: core)
  #------------------------------------------------------------------------------------

  # // Window-related functions
  # RayWindow.init                          // Initialize window and OpenGL context
  # RayWindow.should_close?                 // Check if KEY_ESCAPE pressed or Close icon pressed
  # RayWindow.close                         // Close window and unload OpenGL context
  # RayWindow.ready?                        // Check if window has been initialized successfully
  # RayWindow.minimized?                    // Check if window has been minimized (or lost focus)
  # RayWindow.resized?                      // Check if window has been resized
  # RayWindow.hidden?                       // Check if window is currently hidden
  # RayWindow.toggle_fullscreen             // Toggle fullscreen mode (only PLATFORM_DESKTOP)
  # RayWindow.unhide                        // Show the window
  # RayWindow.hide                          // Hide the window
  # RayWindow.icon=                         // Set icon for window (only PLATFORM_DESKTOP)
  # RayWindow.title=                        // Set title for window (only PLATFORM_DESKTOP)
  # RayWindow.set_position                  // Set window position on screen (only PLATFORM_DESKTOP)
  # RayWindow.monitor=                      // Set monitor for the current window (fullscreen mode)
  # RayWindow.set_min_size                  // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
  # RayWindow.set_size                      // Set window dimensions
  # RayWindow.handle                        // Get native window handle
  # RayWindow.width                         // Get current screen width
  # RayWindow.height                        // Get current screen height
  # RayMonitor.count                        // Get number of connected monitors
  # RayMonitor.width                        // Get primary monitor width
  # RayMonitor.height                       // Get primary monitor height
  # RayMonitor.physical_width               // Get primary monitor physical width in millimetres
  # RayMonitor.physycal_height              // Get primary monitor physical height in millimetres
  # RayWindow.position                      // Get window position XY on monitor
  # RayMonitor.name                         // Get the human-readable, UTF-8 encoded name of the primary monitor
  # RayClipboard.text                       // Get clipboard text content
  # RayClipboard.text=                      // Set clipboard text content

  # // Cursor-related functions
  # RayCursor.show                          // Shows cursor
  # RayCursor.hide                          // Hides cursor
  # RayCursor.hidden?                       // Check if cursor is not visible
  # RayCursor.enable                        // Enables cursor (unlock cursor)
  # RayCursor.disable                       // Disables cursor (lock cursor)

  # // Drawing-related functions
  # RayDraw.clear_background                // Set background color (framebuffer clear color)
  # RayDraw.begin_drawing                   // Setup canvas (framebuffer) to start drawing
  # RayDraw.end_drawing                     // End canvas drawing and swap buffers (double buffering)
  # RayCamera2D#begin_mode2d                // Initialize 2D mode with custom camera (2D)
  # RayCamera2D#end_mode2d                  // Ends 2D mode with custom camera
  # RayCamera#begin_mode3d                  // Initializes 3D mode with custom camera (3D)
  # RayCamera#end_mode3d                    // Ends 3D mode and returns to default 2D orthographic mode
  # RayRenderTexture2D#begin_texture_mode   // Initializes render texture for drawing
  # RayRenderTexture2D#end_texture_mode     // Ends drawing to render texture
  # RayDraw.begin_scissor_mode              // Begin scissor mode (define screen area for following drawing)
  # RayDraw.end_scissor_mode                // End scissor mode

  # // Screen-space-related functions
  # RayCamera#ray                           // Returns a ray trace from mouse position
  # RayCamera#matrix                        // Returns camera transform matrix (view matrix)
  # RayCamera2D#matrix                      // Returns camera 2d transform matrix
  # RayCamera#world_to_screen               // Returns the screen space position for a 3d world space position
  # RayCamera2D#world_to_screen             // Returns the screen space position for a 2d camera world space position
  # RayCamera2D#screen_to_world             // Returns the world space position for a 2d camera screen space position

  # // Timming-related functions
  # RayWindow.target_fps=                   // Set target FPS (maximum)
  # RayWindow.fps                           // Returns current FPS
  # RayWindow.time_since_frame              // Returns time in seconds for last frame drawn
  # RayWindow.time_since_init               // Returns elapsed time in seconds since InitWindow()

  # // Color-related functions
  # RayColor#to_i                           // Returns hexadecimal value for a Color
  # RayColor#to_normalize                   // Returns color normalized as float [0..1]
  # RayColor.from_normalize                 // Returns color from normalized values [0..1]
  # RayColor.to_hsv                         // Returns HSV values for a Color
  # RayColor.from_hsv                       // Returns a Color from HSV values
  # RayColor.from_i                         // Returns a Color struct from hexadecimal value
  # RayColor.fade                           // Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

  # // Misc. functions
  # Raylib.config_flags=                    // Setup window configuration flags (view FLAGS)
  # Raylib.trace_log_level=                 // Set the current threshold (minimum) log level
  # Raylib.trace_log_exit=                  // Set the exit threshold (minimum) log level
  # Raylib.trace_log_callback=              // Set a trace log callback to enable custom logging
  # Raylib.trace_log                        // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
  # Raylib.take_screenshot                  // Takes a screenshot of current screen (saved a .png)
  # Raylib.random_value                     // Returns a random value between min and max (both included)

  # // Files management functions
  # Raylib.file_exists?                 ,   // Check if file exists
  # Raylib.file_extension?                 ,// Check file extension
  # Raylib.directory_exists?                // Check if a directory path exists
  # Raylib.extension                        // Get pointer to extension for a filename string
  # Raylib.file_name                        // Get pointer to filename for a path string
  # Raylib.file_name_without_ext            // Get filename string without extension (uses static string)
  # Raylib.directory_path                   // Get full path for a given fileName with path (uses static string)
  # Raylib.prev_directory_path              // Get previous directory path for a given path (uses static string)
  # Raylib.working_directory                // Get current working directory (uses static string)
  # Raylib.directory_files                  // Get filenames in a directory path (memory should be freed)
  # Raylib.clear_directory_files            // Clear directory files paths buffers (free memory)
  # Raylib.change_directory                 // Change working directory, returns true if success
  # Raylib.file_dropped?                 ,  // Check if a file has been dropped into window
  # Raylib.dropped_files                    // Get dropped files names (memory should be freed)
  # Raylib.clear_dropped_files              // Clear dropped files paths buffer (free memory)
  # Raylib.file_mod_time                    // Get file modification time (last write time)

  # Raylib.compress_data                    // Compress data (DEFLATE algorythm)
  # Raylib.decompress_data                  // Decompress data (DEFLATE algorythm)

  # // Persistent storage management
  # Raylib.storage_save_value               // Save integer value to storage file (to defined position)
  # Raylib.storage_load_value               // Load integer value from storage file (from defined position)

  # Raylib.open_url                         // Open URL with default system browser (if available)

  #------------------------------------------------------------------------------------
  # Input Handling Functions (Module: core)
  #------------------------------------------------------------------------------------

  # // Input-related functions: keyboard
  # RayKey.is_pressed?,                     // Detect if a key has been pressed once
  # RayKey.is_down?,                        // Detect if a key is being pressed
  # RayKey.is_released?,                    // Detect if a key has been released once
  # RayKey.is_up?,                          // Detect if a key is NOT being pressed
  # RayKey.exit_key=,                       // Set a custom key to exit program (default is ESC)
  # RayKey.key_pressed,                     // Get key pressed, call it multiple times for chars queued

  # // Input-related functions: gamepads
  # RayGamepad.available?                   // Detect if a gamepad is available
  # RayGamepad.name?                        // Check gamepad name (if available)
  # RayGamepad.name                         // Return gamepad internal name id
  # RayGamepad.button_pressed?              // Detect if a gamepad button has been pressed once
  # RayGamepad.button_down?                 // Detect if a gamepad button is being pressed
  # RayGamepad.button_released?             // Detect if a gamepad button has been released once
  # RayGamepad.button_up?                   // Detect if a gamepad button is NOT being pressed
  # RayGamepad.last_button                  // Get the last gamepad button pressed
  # RayGamepad.axis_count                   // Return gamepad axis count for a gamepad
  # RayGamepad.axis_movement                // Return axis movement value for a gamepad axis

  # // Input-related functions: mouse
  # RayMouse.button_pressed?                // Detect if a mouse button has been pressed once
  # RayMouse.button_down?                   // Detect if a mouse button is being pressed
  # RayMouse.button_released?               // Detect if a mouse button has been released once
  # RayMouse.button_up?                     // Detect if a mouse button is NOT being pressed
  # RayMouse.x                              // Returns mouse position X
  # RayMouse.y                              // Returns mouse position Y
  # RayMouse.position                       // Returns mouse position XY
  # RayMouse.set_position                   // Set mouse position XY
  # RayMouse.set_offset                     // Set mouse offset
  # RayMouse.set_scale                      // Set mouse scaling
  # RayMouse.wheel_move                     // Returns mouse wheel movement Y

  # // Input-related functions: touch
  # RayTouch.x                              // Returns touch position X for touch point 0 (relative to screen size)
  # RayTouch.y                              // Returns touch position Y for touch point 0 (relative to screen size)
  # RayTouch.position                       // Returns touch position XY for a touch point index (relative to screen size)

  #------------------------------------------------------------------------------------
  # Gestures and Touch Handling Functions (Module: gestures)
  #------------------------------------------------------------------------------------

  # RayTouch.gestures=
  # RayTouch.is_gesture?
  # RayTouch.gesture
  # RayTouch.points_count
  # RayTouch.hold_duration
  # RayTouch.drag_vector
  # RayTouch.drag_angle
  # RayTouch.pinch_vector
  # RayTouch.pinch_angle

  #------------------------------------------------------------------------------------
  # Camera System Functions (Module: camera)
  #------------------------------------------------------------------------------------

  attach_function :SetCameraMode, [Camera.by_value, :int], :void              # Camera3D#mode=
  attach_function :UpdateCamera, [Camera.ptr], :void                          # Camera3D#update

  attach_function :SetCameraPanControl, %i[int], :void                        # Camera3D#pan_control=
  attach_function :SetCameraAltControl, %i[int], :void                        # Camera3D#alt_control=
  attach_function :SetCameraSmoothZoomControl, %i[int], :void                 # Camera3D#smooth_zoom_control=
  attach_function :SetCameraMoveControls, %i[int int int int int int], :void  # Camera3D#set_move_controls

  #------------------------------------------------------------------------------------
  # Basic Shapes Drawing Functions (Module: shapes)
  #------------------------------------------------------------------------------------

  # Basic shapes drawing functions
  # Ruby note: All functions in Raylib::Draw type.
  attach_function :DrawPixel, [:int, :int, Color.by_value], :void
  attach_function :DrawPixelV, [Vector2.by_value, Color.by_value], :void
  attach_function :DrawLine, [:int, :int, :int, :int, Color.by_value], :void
  attach_function :DrawLineV, [Vector2.by_value, Vector2.by_value, Color.by_value], :void
  attach_function :DrawLineEx, [Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void
  attach_function :DrawLineBezier, [Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void
  attach_function :DrawCircle, [:int, :int, :float, Color.by_value], :void
  attach_function :DrawCircleGradient, [:int, :int, :float, Color.by_value, Color.by_value], :void
  attach_function :DrawCircleV, [Vector2.by_value, :float, Color.by_value], :void
  attach_function :DrawCircleLines, [:int, :int, :float, Color.by_value], :void
  attach_function :DrawRectangle, [:int, :int, :int, :int, Color.by_value], :void
  attach_function :DrawRectangleV, [Vector2.by_value, Vector2.by_value, Color.by_value], :void
  attach_function :DrawRectangleRec, [Rectangle.by_value, Color.by_value], :void
  attach_function :DrawRectanglePro, [Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void
  attach_function :DrawRectangleGradientV, [:int, :int, :int, :int, Color.by_value, Color.by_value], :void
  attach_function :DrawRectangleGradientH, [:int, :int, :int, :int, Color.by_value, Color.by_value], :void
  attach_function :DrawRectangleGradientEx, [Rectangle.by_value, Color.by_value, Color.by_value, Color.by_value, Color.by_value], :void
  attach_function :DrawRectangleLines, [:int, :int, :int, :int, Color.by_value], :void
  attach_function :DrawRectangleLinesEx, [Rectangle.by_value, :float, Color.by_value], :void
  attach_function :DrawTriangle, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Color.by_value], :void
  attach_function :DrawTriangleLines, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Color.by_value], :void
  attach_function :DrawPoly, [Vector2.by_value, :int, :float, :float, Color.by_value], :void

  # Basic shapes collision detection functions
  # Ruby note: All functions in Raylib::Collision type.
  attach_function :CheckCollisionRecs, [Rectangle.by_value, Rectangle.by_value], :bool
  attach_function :CheckCollisionCircles, [Vector2.by_value, :float, Vector2.by_value, :float], :bool
  attach_function :CheckCollisionCircleRec, [Vector2.by_value, :float, Rectangle.by_value], :bool
  attach_function :GetCollisionRec, [Rectangle.by_value, Rectangle.by_value], Rectangle.by_value
  attach_function :CheckCollisionPointRec, [Vector2.by_value, Rectangle.by_value], :bool
  attach_function :CheckCollisionPointCircle, [Vector2.by_value, Vector2.by_value, :float], :bool
  attach_function :CheckCollisionPointTriangle, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Vector2.by_value], :bool

  #------------------------------------------------------------------------------------
  # Texture Loading and Drawing Functions (Module: textures)
  #------------------------------------------------------------------------------------

  # Image/Texture2D data loading/unloading/saving functions
  attach_function :LoadImage, [:string], Image.by_value                         # Image#load
  attach_function :LoadImageEx, %i[pointer int int], Image.by_value             # Image#load_ex
  attach_function :LoadImagePro, %i[pointer int int int], Image.by_value        # Image#load_pro
  attach_function :LoadImageRaw, %i[string int int int int], Image.by_value     # Image#load_raw
  attach_function :ExportImage, [:string, Image.by_value], :void                # Image#export
  attach_function :LoadTexture, [:string], Texture2D.by_value                   # Texture2D#load
  attach_function :LoadTextureFromImage, [Image.by_value], Texture2D.by_value   # Image#to_texture2d
  attach_function :LoadRenderTexture, %i[int int], RenderTexture2D.by_value     # RenderTexture2D#load
  attach_function :UnloadImage, [Image.by_value], :void                         # Image#unload
  attach_function :UnloadTexture, [Texture2D.by_value], :void                   # Texture2D#unload
  attach_function :UnloadRenderTexture, [RenderTexture2D.by_value], :void       # RenderTexture2D#unload
  attach_function :GetImageData, [Image.by_value], :pointer                     # Image#to_data
  attach_function :GetImageDataNormalized, [Image.by_value], :pointer           # Image#to_data_normalized
  attach_function :GetPixelDataSize, %i[int int int], :int                      # Image#pixel_data_size
  attach_function :GetTextureData, [Texture2D.by_value], Image.by_value         # Texture2D#to_image
  attach_function :UpdateTexture, [Texture2D.by_value, :pointer], :void         # Texture2D#update

  # Image manipulation functions
  # Ruby note: All functions in Raylib::Image type.
  attach_function :ImageCopy, [Image.by_value], Image.by_value
  attach_function :ImageToPOT, [Image.ptr, Color.by_value], :void
  attach_function :ImageFormat, [Image.ptr, :int], :void
  attach_function :ImageAlphaMask, [Image.ptr, Image.by_value], :void
  attach_function :ImageAlphaClear, [Image.ptr, Color.by_value, :float], :void
  attach_function :ImageAlphaCrop, [Image.ptr, :float], :void
  attach_function :ImageAlphaPremultiply, [Image.ptr], :void
  attach_function :ImageCrop, [Image.ptr, Rectangle.by_value], :void
  attach_function :ImageResize, [Image.ptr, :int, :int], :void
  attach_function :ImageResizeNN, [Image.ptr, :int, :int], :void
  attach_function :ImageResizeCanvas, [Image.ptr, :int, :int, :int, :int, Color.by_value], :void
  attach_function :ImageMipmaps, [Image.ptr], :void
  attach_function :ImageDither, [Image.ptr, :int, :int, :int, :int], :void
  attach_function :ImageText, [:string, :int, Color.by_value], Image.by_value
  attach_function :ImageTextEx, [Font.by_value, :string, :float, :float, Color.by_value], Image.by_value
  attach_function :ImageDraw, [Image.ptr, Image.by_value, Rectangle.by_value, Rectangle.by_value], :void
  attach_function :ImageDrawRectangle, [Image.ptr, Vector2.by_value, Rectangle.by_value, Color.by_value], :void
  attach_function :ImageDrawText, [Image.ptr, Vector2.by_value, :string, :int, Color.by_value], :void
  attach_function :ImageDrawTextEx, [Image.ptr, Vector2.by_value, Font.by_value, :string, :float, :float, Color.by_value], :void
  attach_function :ImageFlipVertical, [Image.ptr], :void
  attach_function :ImageFlipHorizontal, [Image.ptr], :void
  attach_function :ImageRotateCW, [Image.ptr], :void
  attach_function :ImageRotateCCW, [Image.ptr], :void
  attach_function :ImageColorTint, [Image.ptr, Color.by_value], :void
  attach_function :ImageColorInvert, [Image.ptr], :void
  attach_function :ImageColorGrayscale, [Image.ptr], :void
  attach_function :ImageColorContrast, [Image.ptr, :float], :void
  attach_function :ImageColorBrightness, [Image.ptr, :int], :void
  attach_function :ImageColorReplace, [Image.ptr, Color.by_value, Color.by_value], :void

  # Image generation functions
  attach_function :GenImageColor, [:int, :int, Color.by_value], Image.by_value                                    # Image#gen_color.by_value
  attach_function :GenImageGradientV, [:int, :int, Color.by_value, Color.by_value], Image.by_value                # Image#gen_gradient_v
  attach_function :GenImageGradientH, [:int, :int, Color.by_value, Color.by_value], Image.by_value                # Image#gen_gradient_h
  attach_function :GenImageGradientRadial, [:int, :int, :float, Color.by_value, Color.by_value], Image.by_value   # Image#gen_gradient_radial
  attach_function :GenImageChecked, [:int, :int, :int, :int, Color.by_value, Color.by_value], Image.by_value      # Image#gen_checked
  attach_function :GenImageWhiteNoise, %i[int int float], Image.by_value                                          # Image#gen_white_noise
  attach_function :GenImagePerlinNoise, %i[int int int int float], Image.by_value                                 # Image#gen_perlin_noise
  attach_function :GenImageCellular, %i[int int int], Image.by_value                                              # Image#gen_cellular

  # Texture2D configuration functions
  attach_function :GenTextureMipmaps, [Texture2D.ptr], :void                                    # Texture2D#gen_mipmaps
  attach_function :SetTextureFilter, [Texture2D.by_value, :int], :void                          # Texture2D#filter=
  attach_function :SetTextureWrap, [Texture2D.by_value, :int], :void                            # Texture2D#wrap=

  # Texture2D drawing functions
  attach_function :DrawTexture, [Texture2D.by_value, :int, :int, Color.by_value], :void                                 # Texture2d#draw
  attach_function :DrawTextureV, [Texture2D.by_value, Vector2.by_value, Color.by_value], :void                          # Texture2d#draw_v
  attach_function :DrawTextureEx, [Texture2D.by_value, Vector2.by_value, :float, :float, Color.by_value], :void         # Texture2d#draw_ex
  attach_function :DrawTextureRec, [Texture2D.by_value, Rectangle.by_value, Vector2.by_value, Color.by_value], :void    # Texture2d#draw_rec
  attach_function :DrawTexturePro, [Texture2D.by_value, Rectangle.by_value, Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void
  # ^ Texture2d#draw_pro

  #------------------------------------------------------------------------------------
  # Font Loading and Text Drawing Functions (Module: text)
  #------------------------------------------------------------------------------------

  # Font loading/unloading functions
  attach_function :GetFontDefault, [], Font.by_value                                          # Font#default
  attach_function :LoadFont, %i[string], Font.by_value                                        # Font#load
  attach_function :LoadFontEx, %i[string int pointer int], Font.by_value                      # Font#load_ex
  attach_function :LoadFontData, %i[string int pointer int bool], :pointer                    # Font#load_data
  attach_function :GenImageFontAtlas, %i[pointer int int int int], Image.by_value             # Font#gen_image_atlas
  attach_function :UnloadFont, [Font.by_value], :void                                         # Font#unload

  # Text drawing functions
  attach_function :DrawFPS, %i[int int], :void                                                          # Draw#fps
  attach_function :DrawText, [:string, :int, :int, :int, Color.by_value], :void                         # Draw#text
  attach_function :DrawTextEx, [Font.by_value, :string, Vector2.by_value, :float, :float, Color.by_value], :void # Draw#text_ex

  # Text misc. functions
  attach_function :MeasureText, %i[string int], :int                                          # Font#measure_text
  attach_function :MeasureTextEx, [Font.by_value, :string, :float, :float], Vector2.by_value  # Font#measure_text_ex
  attach_function :GetGlyphIndex, [Font.by_value, :int], :int                                 # Font#glyph_index

  # Text strings management functions
  # FIXME: maybe point to ruby versions instead.

  #------------------------------------------------------------------------------------
  # Basic 3d Shapes Drawing Functions (Module: models)
  #------------------------------------------------------------------------------------

  # Basic geometric 3D shapes drawing functions
  attach_function :DrawLine3D, [Vector3.by_value, Vector3.by_value, Color.by_value], :void                                # Draw#line_3d
  attach_function :DrawCircle3D, [Vector3.by_value, :float, Vector3.by_value, :float, Color.by_value], :void              # Draw#circle_3d
  attach_function :DrawCube, [Vector3.by_value, :float, :float, :float, Color.by_value], :void                            # Draw#cube
  attach_function :DrawCubeV, [Vector3.by_value, Vector3.by_value, Color.by_value], :void                                 # Draw#cube_v
  attach_function :DrawCubeWires, [Vector3.by_value, :float, :float, :float, Color.by_value], :void                       # Draw#cube_wires
  attach_function :DrawCubeTexture, [Texture2D.by_value, Vector3.by_value, :float, :float, :float, Color.by_value], :void # Draw#cube_texture
  attach_function :DrawSphere, [Vector3.by_value, :float, Color.by_value], :void                                          # Draw#sphere
  attach_function :DrawSphereEx, [Vector3.by_value, :float, :int, :int, Color.by_value], :void                            # Draw#sphere_ex
  attach_function :DrawSphereWires, [Vector3.by_value, :float, :int, :int, Color.by_value], :void                         # Draw#sphere_wires
  attach_function :DrawCylinder, [Vector3.by_value, :float, :float, :float, :int, Color.by_value], :void                  # Draw#cylinder
  attach_function :DrawCylinderWires, [Vector3.by_value, :float, :float, :float, :int, Color.by_value], :void             # Draw#cylinder_wires
  attach_function :DrawPlane, [Vector3.by_value, Vector2.by_value, Color.by_value], :void                                 # Draw#plane
  attach_function :DrawRay, [Ray.by_value, Color.by_value], :void                                                         # Ray#draw
  attach_function :DrawGrid, %i[int float], :void                                                                         # Draw#grid
  attach_function :DrawGizmo, [Vector3.by_value], :void                                                                   # Draw#gizmo
  # DrawTorus(), DrawTeapot() could be useful?

  #------------------------------------------------------------------------------------
  # Model 3d Loading and Drawing Functions (Module: models)
  #------------------------------------------------------------------------------------

  # Model loading/unloading functions
  attach_function :LoadModel, %i[string], Model.by_value                    # Model#load
  attach_function :LoadModelFromMesh, [Mesh.by_value], Model.by_value       # Mesh#to_model
  attach_function :UnloadModel, [Model.by_value], :void                     # Model#unload

  # Mesh loading/unloading functions
  # FIXME: LoadMeshes
  attach_function :UnloadMesh, [Mesh.ptr], :void                            # Mesh#unload
  attach_function :ExportMesh, [:string, Mesh.by_value], :void              # Mesh#export

  # Mesh manipulation functions
  attach_function :MeshBoundingBox, [Mesh.by_value], BoundingBox.by_value   # Mesh#
  attach_function :MeshTangents, [Mesh.ptr], :void                          # Mesh#
  attach_function :MeshBinormals, [Mesh.ptr], :void                         # Mesh#

  # Mesh generation functions
  attach_function :GenMeshPlane, %i[float float int int], Mesh.by_value                   # Mesh#gen_plane
  attach_function :GenMeshCube, %i[float float float], Mesh.by_value                      # Mesh#gen_cube
  attach_function :GenMeshSphere, %i[float int int], Mesh.by_value                        # Mesh#gen_sphere
  attach_function :GenMeshHemiSphere, %i[float int int], Mesh.by_value                    # Mesh#gen_hemisphere
  attach_function :GenMeshCylinder, %i[float float int], Mesh.by_value                    # Mesh#gen_cylinder
  attach_function :GenMeshTorus, %i[float float int int], Mesh.by_value                   # Mesh#gen_torus
  attach_function :GenMeshKnot, %i[float float int int], Mesh.by_value                    # Mesh#gen_knot
  attach_function :GenMeshHeightmap, [Image.by_value, Vector3.by_value], Mesh.by_value    # Mesh#gen_heightmap
  attach_function :GenMeshCubicmap, [Image.by_value, Vector3.by_value], Mesh.by_value     # Mesh#gen_cubicmap

  # Material loading/unloading functions
  attach_function :LoadMaterials, %i[string pointer], :pointer                            # Material#load
  attach_function :LoadMaterialDefault, [], Material.by_value                             # Material#load_default
  attach_function :UnloadMaterial, [Material.by_value], :void                             # Material#unload

  # Model drawing functions
  attach_function :DrawModel, [Model.by_value, Vector3.by_value, :float, Color.by_value], :void                                                   # Model#draw
  attach_function :DrawModelEx, [Model.by_value, Vector3.by_value, Vector3.by_value, :float, Vector3.by_value, Color.by_value], :void             # Model#draw_ex
  attach_function :DrawModelWires, [Model.by_value, Vector3.by_value, :float, Color.by_value], :void                                              # Model#draw_wires
  attach_function :DrawModelWiresEx, [Model.by_value, Vector3.by_value, Vector3.by_value, :float, Vector3.by_value, Color.by_value], :void        # Model#draw_wires_ex
  attach_function :DrawBoundingBox, [BoundingBox.by_value, Color.by_value], :void                                                                 # BoundingBox#draw
  attach_function :DrawBillboard, [Camera.by_value, Texture2D.by_value, Vector3.by_value, :float, Color.by_value], :void                          # Draw#billboard
  attach_function :DrawBillboardRec, [Camera.by_value, Texture2D.by_value, Rectangle.by_value, Vector3.by_value, :float, Color.by_value], :void   # Draw#billboard_rec

  # Collision detection functions
  attach_function :CheckCollisionSpheres, [Vector3.by_value, :float, Vector3.by_value, :float], :bool                                   # Collision#check_spheres
  attach_function :CheckCollisionBoxes, [BoundingBox.by_value, BoundingBox.by_value], :bool                                             # Collision#check_boxes
  attach_function :CheckCollisionBoxSphere, [BoundingBox.by_value, Vector3.by_value, :float], :bool                                     # Collision#check_box_sphere
  attach_function :CheckCollisionRaySphere, [Ray.by_value, Vector3.by_value, :float], :bool                                             # Collision#check_ray_sphere
  attach_function :CheckCollisionRaySphereEx, [Ray.by_value, Vector3.by_value, :float, Vector3.ptr], :bool                              # Collision#check_ray_sphere_ex
  attach_function :CheckCollisionRayBox, [Ray.by_value, BoundingBox.by_value], :bool                                                    # Collision#check_ray_box
  attach_function :GetCollisionRayModel, [Ray.by_value, Model.ptr], RayHitInfo.by_value                                                 # Collision#check_ray_model
  attach_function :GetCollisionRayTriangle, [Ray.by_value, Vector3.by_value, Vector3.by_value, Vector3.by_value], RayHitInfo.by_value   # Collision#check_ray_triangle
  attach_function :GetCollisionRayGround, [Ray.by_value, :float], RayHitInfo.by_value                                                   # Collision#check_ray_ground

  #------------------------------------------------------------------------------------
  # Shaders System Functions (Module: rlgl)
  # NOTE: This functions are useless when using OpenGL 1.1
  #------------------------------------------------------------------------------------

  # Shader loading/unloading functions
  attach_function :LoadText, [:string], :string                                                           # Raylib#load_text
  attach_function :LoadShader, %i[string string], Shader.by_value                                         # Shader#load
  attach_function :LoadShaderCode, %i[string string], Shader.by_value                                     # Shader#load_code
  attach_function :UnloadShader, [Shader.by_value], :void                                                 # Shader#unload

  attach_function :GetShaderDefault, [], Shader.by_value                                                  # Shader#default
  attach_function :GetTextureDefault, [], Texture2D.by_value                                              # Texture2D#default

  # Shader configuration functions
  attach_function :GetShaderLocation, [Shader.by_value, :string], :int                                    # Shader#location
  attach_function :SetShaderValue, [Shader.by_value, :int, :pointer, :int], :void                         # Shader#set_value
  attach_function :SetShaderValueV, [Shader.by_value, :int, :pointer, :int, :int], :void                  # Shader#set_value_v
  attach_function :SetShaderValueTexture, [Shader.by_value, :int, Texture2D.by_value], :void              # Shader#set_value_texture
  attach_function :SetShaderValueMatrix, [Shader.by_value, :int, Matrix.by_value], :void                  # Shader#set_value_matrix
  attach_function :SetMatrixProjection, [Matrix.by_value], :void                                          # Shader#matrix_projection=
  attach_function :SetMatrixModelview, [Matrix.by_value], :void                                           # Shader#matrix_modelview=
  attach_function :GetMatrixModelview, [], Matrix.by_value                                                # Shader#matrix_modelview

  # Texture maps generation (PBR)
  # NOTE: Required shaders should be provided
  attach_function :GenTextureCubemap, [Shader.by_value, Texture2D.by_value, :int], Texture2D.by_value     # Shader#gen_texture_cubemap
  attach_function :GenTextureIrradiance, [Shader.by_value, Texture2D.by_value, :int], Texture2D.by_value  # Shader#gen_texture_irradiance
  attach_function :GenTexturePrefilter, [Shader.by_value, Texture2D.by_value, :int], Texture2D.by_value   # Shader#gen_texture_prefilter
  attach_function :GenTextureBRDF, [Shader.by_value, Texture2D.by_value, :int], Texture2D.by_value        # Shader#gen_texture_brdf

  # Shading begin/end functions
  attach_function :BeginShaderMode, [Shader.by_value], :void                                              # Shader#begin_shader_mode
  attach_function :EndShaderMode, [], :void                                                               # Shader#end_shader_mode
  attach_function :BeginBlendMode, %i[int], :void                                                         # Draw#begin_blend_mode
  attach_function :EndBlendMode, [], :void                                                                # Draw#end_blend_mode

  # VR control functions
  attach_function :InitVrSimulator, [], :void                                                             # VrDeviceInfo#init_vr_simulator
  attach_function :CloseVrSimulator, [], :void                                                            # VrDeviceInfo#close_vr_simulator
  attach_function :UpdateVrTracking, [Camera.ptr], :void                                                  # VrDeviceInfo#vr_tracking=
  attach_function :SetVrConfiguration, [VrDeviceInfo.by_value, Shader.by_value], :void                    # VrDeviceInfo#distortion=
  attach_function :IsVrSimulatorReady, [], :bool                                                          # VrDeviceInfo#is_vr_simulator_ready?
  attach_function :ToggleVrMode, [], :void                                                                # VrDeviceInfo#toggle_vr_mode
  attach_function :BeginVrDrawing, [], :void                                                              # VrDeviceInfo#begin_vr_drawing
  attach_function :EndVrDrawing, [], :void                                                                # VrDeviceInfo#end_vr_drawing

  #------------------------------------------------------------------------------------
  # Audio Loading and Playing Functions (Module: audio)
  #------------------------------------------------------------------------------------

  # Audio device management functions
  attach_function :InitAudioDevice, [], :void                                         # AudioDevice#init
  attach_function :CloseAudioDevice, [], :void                                        # AudioDevice#close
  attach_function :IsAudioDeviceReady, [], :bool                                      # AudioDevice#is_ready?
  attach_function :SetMasterVolume, [:float], :void                                   # AudioDevice#master_volume=

  # Wave/Sound loading/unloading functions
  attach_function :LoadWave, %i[string], Wave.by_value                                # Wave#load
  #attach_function :LoadWaveEx, %i[pointer int int int int], Wave.by_value             # Wave#load_ex
  attach_function :LoadSound, [:string], Sound.by_value                               # Sound#load
  attach_function :LoadSoundFromWave, [Wave.by_value], Sound.by_value                 # Wave#to_sound
  attach_function :UpdateSound, [Sound.by_value, :pointer, :int], :void               # Sound#update
  attach_function :UnloadWave, [Wave.by_value], :void                                 # Wave#unload
  attach_function :UnloadSound, [Sound.by_value], :void                               # Sound#unload

  # Wave/Sound management functions
  attach_function :PlaySound, [Sound.by_value], :void                                 # Sound#play
  attach_function :PauseSound, [Sound.by_value], :void                                # Sound#pause
  attach_function :ResumeSound, [Sound.by_value], :void                               # Sound#resume
  attach_function :StopSound, [Sound.by_value], :void                                 # Sound#stop
  attach_function :IsSoundPlaying, [Sound.by_value], :bool                            # Sound#is_playing?
  attach_function :SetSoundVolume, [Sound.by_value, :float], :void                    # Sound#volume=
  attach_function :SetSoundPitch, [Sound.by_value, :float], :void                     # Sound#pitch=
  attach_function :WaveFormat, [Wave.ptr, :int, :int, :int], :void                    # Wave#format!
  attach_function :WaveCopy, [Wave.by_value], Wave.by_value                           # Wave#copy
  attach_function :WaveCrop, [Wave.ptr, :int, :int], :void                            # Wave#crop!
  attach_function :GetWaveData, [Wave.by_value], :pointer                             # Wave#to_data

  # Music management functions
  attach_function :LoadMusicStream, [:string], Music.ptr                              # Music#load
  attach_function :UnloadMusicStream, [Music.ptr], :void                              # Music#unload
  attach_function :PlayMusicStream, [Music.ptr], :void                                # Music#play
  attach_function :UpdateMusicStream, [Music.ptr], :void                              # Music#update
  attach_function :StopMusicStream, [Music.ptr], :void                                # Music#stop
  attach_function :PauseMusicStream, [Music.ptr], :void                               # Music#pause
  attach_function :ResumeMusicStream, [Music.ptr], :void                              # Music#resume
  attach_function :IsMusicPlaying, [Music.ptr], :bool                                 # Music#is_playing?
  attach_function :SetMusicVolume, [Music.ptr, :float], :void                         # Music#volume=
  attach_function :SetMusicPitch, [Music.ptr, :float], :void                          # Music#pitch=
  attach_function :SetMusicLoopCount, [Music.ptr, :int], :void                        # Music#loop_count=
  attach_function :GetMusicTimeLength, [Music.ptr], :float                            # Music#time_length
  attach_function :GetMusicTimePlayed, [Music.ptr], :float                            # Music#time_played

  # AudioStream management functions
  attach_function :InitAudioStream, %i[uint uint uint], AudioStream.by_value          # AudioStream#create
  attach_function :UpdateAudioStream, [AudioStream.by_value, :pointer, :int], :void   # AudioStream#update
  attach_function :CloseAudioStream, [AudioStream.by_value], :void                    # AudioStream#close
#  attach_function :IsAudioBufferProcessed, [AudioStream.by_value], :bool              # AudioStream#is_buffer_processed?
  attach_function :PlayAudioStream, [AudioStream.by_value], :void                     # AudioStream#play
  attach_function :PauseAudioStream, [AudioStream.by_value], :void                    # AudioStream#pause
  attach_function :ResumeAudioStream, [AudioStream.by_value], :void                   # AudioStream#resume
  attach_function :IsAudioStreamPlaying, [AudioStream.by_value], :bool                # AudioStream#is_playing?
  attach_function :StopAudioStream, [AudioStream.by_value], :void                     # AudioStream#stop
  attach_function :SetAudioStreamVolume, [AudioStream.by_value, :float], :void        # AudioStream#volume=
  attach_function :SetAudioStreamPitch, [AudioStream.by_value, :float], :void         # AudioStream#pitch=
end
