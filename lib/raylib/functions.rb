module Raylib # rubocop:disable Metrics/ModuleLength Metrics/LineLength
  extend FFI::Library

  ffi_lib 'raylib'

  #------------------------------------------------------------------------------------
  # Window and Graphics Device Functions (Module: core)
  #------------------------------------------------------------------------------------

  # Window-related functions
  attach_function :InitWindow, %i[int int string], :void                  # Window#init
  attach_function :CloseWindow, [], :void                                 # Window#close
  attach_function :IsWindowReady, [], :bool                               # Window#is_ready?
  attach_function :WindowShouldClose, [], :bool                           # Window#should_close?
  attach_function :IsWindowMinimized, [], :bool                           # Window#is_minimized?
  attach_function :ToggleFullscreen, [], :bool                            # Window#toggle_fullscreen
  attach_function :SetWindowIcon, [Image.by_value], :void                 # Window#icon=
  attach_function :SetWindowTitle, %i[string], :void                      # Window#title=
  attach_function :SetWindowPosition, %i[int int], :void                  # Window#set_position
  attach_function :SetWindowMonitor, %i[int], :void                       # Window#monitor=
  attach_function :SetWindowMinSize, %i[int int], :void                   # Window#set_min_size
  attach_function :SetWindowSize, %i[int int], :void                      # Window#set_size
  attach_function :GetScreenWidth, [], :int                               # Window#width
  attach_function :GetScreenHeight, [], :int                              # Window#height

  # Cursor-related functions
  attach_function :ShowCursor, [], :void                                  # Cursor#show
  attach_function :HideCursor, [], :void                                  # Cursor#hide
  attach_function :IsCursorHidden, [], :bool                              # Cursor#is_hidden?
  attach_function :EnableCursor, [], :void                                # Cursor#enable
  attach_function :DisableCursor, [], :void                               # Cursor#disable

  # Drawing-related functions
  attach_function :ClearBackground, [Color.by_value], :void               # Draw#clear_background
  attach_function :BeginDrawing, [], :void                                # Draw#begin_drawing
  attach_function :EndDrawing, [], :void                                  # Draw#end_drawing
  attach_function :BeginMode2D, [Camera2D.by_value], :void                # Camera2D#begin_mode2d
  attach_function :EndMode2D, [], :void                                   # Camera2D#end_mode2d
  attach_function :BeginMode3D, [Camera.by_value], :void                  # Camera3D#begin_mode3d
  attach_function :EndMode3D, [], :void                                   # Camera3D#end_mode3d
  attach_function :BeginTextureMode, [RenderTexture2D.by_value], :void    # RenderTexture2D#begin_texture_mode
  attach_function :EndTextureMode, [], :void                              # RenderTexture2D#end_texture_mode

  # Screen-space-related functions
  attach_function :GetMouseRay, [Vector2.by_value, Camera.by_value], Ray.by_value           # Camera3D#ray
  attach_function :GetWorldToScreen, [Vector3.by_value, Camera.by_value], Vector2.by_value  # Camera3D#world_to_screen
  attach_function :GetCameraMatrix, [Camera.by_value], Matrix.by_value                      # Camera3D#matrix

  # Timming-related functions
  attach_function :SetTargetFPS, [:int], :void                            # Window#target_fps=
  attach_function :GetFPS, [], :int                                       # Window#fps
  attach_function :GetFrameTime, [], :float                               # Window#time_since_frame
  attach_function :GetTime, [], :double                                   # Window#time_since_init

  # Color-related functions
  attach_function :ColorToInt, [Color.by_value], :int                     # Color#to_i
  attach_function :ColorNormalize, [Color.by_value], Vector4.by_value     # Color#to_normalize
  attach_function :ColorToHSV, [Color.by_value], Vector3.by_value         # Color#to_hsv
  attach_function :GetColor, %i[int], Color.by_value                      # Color#from_i
  attach_function :Fade, [Color.by_value, :float], Color.by_value         # Color#fade

  # Misc. functions
  attach_function :ShowLogo, [], :void                                    # Raylib#show_logo
  attach_function :SetConfigFlags, %i[uchar], :void                       # Raylib#config_flags=
  attach_function :SetTraceLog, %i[uchar], :void                          # Raylib#trace_log=
  attach_function :TraceLog, %i[int string varargs], :void                # Raylib#trace_log
  attach_function :TakeScreenshot, %i[string], :void                      # Raylib#take_screenshot
  attach_function :GetRandomValue, %i[int int], :int                      # Raylib#random_value

  # Files management functions
  attach_function :IsFileExtension, %i[string string], :bool              # Raylib#is_file_extension?
  attach_function :GetExtension, %i[string], :string                      # Raylib#get_extension
  attach_function :GetFileName, %i[string], :string                       # Raylib#get_file_name
  attach_function :GetDirectoryPath, %i[string], :string                  # Raylib#get_directory_path
  attach_function :GetWorkingDirectory, [], :string                       # Raylib#get_working_directory
  attach_function :ChangeDirectory, %i[string], :bool                     # Raylib#change_directory
  attach_function :IsFileDropped, [], :bool                               # Raylib#is_file_dropped?
  attach_function :GetDroppedFiles, [], :pointer                          # Raylib#get_dropped_files
  attach_function :ClearDroppedFiles, [], :void                           # Raylib#clear_dropped_files

  # Persistent storage management
  attach_function :StorageSaveValue, %i[int int], :void                   # Raylib#storage_save_value
  attach_function :StorageLoadValue, %i[int], :int                        # Raylib#storage_load_value

  #------------------------------------------------------------------------------------
  # Input Handling Functions (Module: core)
  #------------------------------------------------------------------------------------

  # Input-related functions: keyboard
  attach_function :IsKeyPressed, [:int], :bool                            # Key#is_pressed?
  attach_function :IsKeyDown, [:int], :bool                               # Key#is_down?
  attach_function :IsKeyReleased, [:int], :bool                           # Key#is_released?
  attach_function :IsKeyUp, [:int], :bool                                 # Key#is_up?
  attach_function :GetKeyPressed, [], :int                                # Key#key_pressed
  attach_function :SetExitKey, [:int], :void                              # Key#exit_key=

  # Input-related functions: gamepads
  attach_function :IsGamepadAvailable, %i[int], :bool                     # Gamepad#is_available?
  attach_function :IsGamepadName, %i[int string], :bool                   # Gamepad#is_name?
  attach_function :GetGamepadName, %i[int], :string                       # Gamepad#name
  attach_function :IsGamepadButtonPressed, %i[int int], :bool             # Gamepad#is_button_pressed?
  attach_function :IsGamepadButtonDown, %i[int int], :bool                # Gamepad#is_button_down?
  attach_function :IsGamepadButtonReleased, %i[int int], :bool            # Gamepad#is_button_released?
  attach_function :IsGamepadButtonUp, %i[int int], :bool                  # Gamepad#is_button_up?
  attach_function :GetGamepadButtonPressed, [], :int                      # Gamepad#button_pressed
  attach_function :GetGamepadAxisCount, %i[int], :int                     # Gamepad#axis_count
  attach_function :GetGamepadAxisMovement, %i[int int], :float            # Gamepad#axis_movement

  # Input-related functions: mouse
  attach_function :IsMouseButtonPressed, [:int], :bool                    # Mouse#is_button_presed?
  attach_function :IsMouseButtonDown, [:int], :bool                       # Mouse#is_button_down?
  attach_function :IsMouseButtonReleased, [:int], :bool                   # Mouse#is_button_released?
  attach_function :IsMouseButtonUp, [:int], :bool                         # Mouse#is_button_up?
  attach_function :GetMouseX, [], :int                                    # Mouse#x
  attach_function :GetMouseY, [], :int                                    # Mouse#y
  attach_function :GetMousePosition, [], Vector2.by_value                 # Mouse#position
  attach_function :SetMousePosition, [Vector2.by_value], :void            # Mouse#position=
  attach_function :SetMouseScale, [:float], :void                         # Mouse#scale=
  attach_function :GetMouseWheelMove, [], :int                            # Mouse#wheel_move

  # Input-related functions: touch
  attach_function :GetTouchX, [], :int                                    # Touch#x
  attach_function :GetTouchY, [], :int                                    # Touch#y
  attach_function :GetTouchPosition, %i[int], Vector2.by_value            # Touch#position

  #------------------------------------------------------------------------------------
  # Gestures and Touch Handling Functions (Module: gestures)
  #------------------------------------------------------------------------------------

  attach_function :SetGesturesEnabled, %i[uint], :void                    # Touch#gestures=
  attach_function :IsGestureDetected, %i[int], :bool                      # Touch#is_gesture?
  attach_function :GetGestureDetected, [], :int                           # Touch#gesture
  attach_function :GetTouchPointsCount, [], :int                          # Touch#points_count
  attach_function :GetGestureHoldDuration, [], :float                     # Touch#hold_duration
  attach_function :GetGestureDragVector, [], Vector2.by_value             # Touch#drag_vector
  attach_function :GetGestureDragAngle, [], :float                        # Touch#drag_angle
  attach_function :GetGesturePinchVector, [], Vector2.by_value            # Touch#pinch_vector
  attach_function :GetGesturePinchAngle, [], :float                       # Touch#pinch_angle

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
  attach_function :DrawPolyEx, [Vector2.ptr, :int, Color.by_value], :void
  attach_function :DrawPolyExLines, [Vector2.ptr, :int, Color.by_value], :void

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
  attach_function :LoadFontEx, %i[string int int pointer], Font.by_value                      # Font#load_ex
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
  attach_function :FormatText, %i[string varargs], :string                                    # Font#format_text
  attach_function :SubText, %i[string int int], :string                                       # Font#sub_text
  attach_function :GetGlyphIndex, [Font.by_value, :int], :int                                 # Font#glyph_index

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
  attach_function :LoadMesh, [:string], Mesh                                # Mesh#load
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
  attach_function :LoadMaterial, %i[string], Material.by_value                            # Material#load
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
  attach_function :SetShaderValuei, [Shader.by_value, :int, :pointer, :int], :void                        # Shader#set_valuei
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
  attach_function :GetVrDeviceInfo, %i[int], VrDeviceInfo.by_value                                        # VrDeviceInfo#device_info
  attach_function :InitVrSimulator, [VrDeviceInfo.by_value], :void                                        # VrDeviceInfo#init_vr_simulator
  attach_function :CloseVrSimulator, [], :void                                                            # VrDeviceInfo#close_vr_simulator
  attach_function :IsVrSimulatorReady, [], :bool                                                          # VrDeviceInfo#is_vr_simulator_ready?
  attach_function :SetVrDistortionShader, [Shader.by_value], :void                                        # VrDeviceInfo#vr_distortion_shader=
  attach_function :UpdateVrTracking, [Camera.ptr], :void                                                  # VrDeviceInfo#vr_tracking=
  attach_function :ToggleVrMode, [], :void                                                                # VrDeviceInfo#toggle_vr_mode
  attach_function :BeginVrDrawing, [], :void                                                              # VrDeviceInfo#begin_vr_drawing
  attach_function :EndVrDrawing, [], :void                                                                # VrDeviceInfo#end_vr_drawing

  #------------------------------------------------------------------------------------
  # Audio Loading and Playing Functions (Module: audio)
  #------------------------------------------------------------------------------------

  # Audio device management functions
  attach_function :InitAudioDevice, [], :void                                         # TODO: Initialize audio device and context
  attach_function :CloseAudioDevice, [], :void                                        # TODO: Close the audio device and context
  attach_function :IsAudioDeviceReady, [], :bool                                      # TODO: Check if audio device has been initialized successfully
  attach_function :SetMasterVolume, [:float], :void                                   # TODO: Set master volume (listener)

  # Wave/Sound loading/unloading functions
  attach_function :LoadWave, %i[string], Wave.by_value                                # TODO: Load wave data from file
  attach_function :LoadWaveEx, %i[pointer int int int int], Wave.by_value             # TODO: Load wave data from raw array data
  attach_function :LoadSound, [:string], Sound.by_value                               # TODO: Load sound from file
  attach_function :LoadSoundFromWave, [Wave.by_value], Sound.by_value                 # TODO: Load sound from wave data
  attach_function :UpdateSound, [Sound.by_value, :pointer, :int], :void               # TODO: Update sound buffer with new data
  attach_function :UnloadWave, [Wave.by_value], :void                                 # TODO: Unload wave data
  attach_function :UnloadSound, [Sound.by_value], :void                               # TODO: Unload sound

  # Wave/Sound management functions
  attach_function :PlaySound, [Sound.by_value], :void                                 # TODO: Play a sound
  attach_function :PauseSound, [Sound.by_value], :void                                # TODO: Pause a sound
  attach_function :ResumeSound, [Sound.by_value], :void                               # TODO: Resume a paused sound
  attach_function :StopSound, [Sound.by_value], :void                                 # TODO: Stop playing a sound
  attach_function :IsSoundPlaying, [Sound.by_value], :bool                            # TODO: Check if a sound is currently playing
  attach_function :SetSoundVolume, [Sound.by_value, :float], :void                    # TODO: Set volume for a sound (1.0 is max level)
  attach_function :SetSoundPitch, [Sound.by_value, :float], :void                     # TODO: Set pitch for a sound (1.0 is base level)
  attach_function :WaveFormat, [Wave.ptr, :int, :int, :int], :void                    # TODO: Convert wave data to desired format
  attach_function :WaveCopy, [Wave.by_value], Wave.by_value                           # TODO: Copy a wave to a new wave
  attach_function :WaveCrop, [Wave.ptr, :int, :int], :void                            # TODO: Crop a wave to defined samples range
  attach_function :GetWaveData, [Wave.by_value], :pointer                             # TODO: Get samples data from wave as a floats array

  # Music management functions
  attach_function :LoadMusicStream, [:string], Music.by_value                         # TODO: Load music stream from file
  attach_function :UnloadMusicStream, [Music.by_value], :void                         # TODO: Unload music stream
  attach_function :PlayMusicStream, [Music.by_value], :void                           # TODO: Start music playing
  attach_function :UpdateMusicStream, [Music.by_value], :void                         # TODO: Updates buffers for music streaming
  attach_function :StopMusicStream, [Music.by_value], :void                           # TODO: Stop music playing
  attach_function :PauseMusicStream, [Music.by_value], :void                          # TODO: Pause music playing
  attach_function :ResumeMusicStream, [Music.by_value], :void                         # TODO: Resume playing paused music
  attach_function :IsMusicPlaying, [Music.by_value], :bool                            # TODO: Check if music is playing
  attach_function :SetMusicVolume, [Music.by_value, :float], :void                    # TODO: Set volume for music (1.0 is max level)
  attach_function :SetMusicPitch, [Music.by_value, :float], :void                     # TODO: Set pitch for a music (1.0 is base level)
  attach_function :SetMusicLoopCount, [Music.by_value, :int], :void                   # TODO: Set music loop count (loop repeats)
  attach_function :GetMusicTimeLength, [Music.by_value], :float                       # TODO: Get music time length (in seconds)
  attach_function :GetMusicTimePlayed, [Music.by_value], :float                       # TODO: Get current music time played (in seconds)

  # AudioStream management functions
  attach_function :InitAudioStream, %i[uint uint uint], AudioStream.by_value          # TODO: Init audio stream (to stream raw audio pcm data)
  attach_function :UpdateAudioStream, [AudioStream.by_value, :pointer, :int], :void   # TODO: Update audio stream buffers with data
  attach_function :CloseAudioStream, [AudioStream.by_value], :void                    # TODO: Close audio stream and free memory
  attach_function :IsAudioBufferProcessed, [AudioStream.by_value], :bool              # TODO: Check if any audio stream buffers requires refill
  attach_function :PlayAudioStream, [AudioStream.by_value], :void                     # TODO: Play audio stream
  attach_function :PauseAudioStream, [AudioStream.by_value], :void                    # TODO: Pause audio stream
  attach_function :ResumeAudioStream, [AudioStream.by_value], :void                   # TODO: Resume audio stream
  attach_function :IsAudioStreamPlaying, [AudioStream.by_value], :bool                # TODO: Check if audio stream is playing
  attach_function :StopAudioStream, [AudioStream.by_value], :void                     # TODO: Stop audio stream
  attach_function :SetAudioStreamVolume, [AudioStream.by_value, :float], :void        # TODO: Set volume for audio stream (1.0 is max level)
  attach_function :SetAudioStreamPitch, [AudioStream.by_value, :float], :void         # TODO: Set pitch for audio stream (1.0 is base level)
end
