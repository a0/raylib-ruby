module Raylib
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
  # Raylib.log_level=                       // Set the current threshold (minimum) log level
  # Raylib.log_exit=                        // Set the exit threshold (minimum) log level
  # Raylib.log_callback=                    // Set a trace log callback to enable custom logging
  # Raylib.log                              // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
  # Raylib.screenshot                       // Takes a screenshot of current screen (saved a .png)
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
  # RayKey.pressed?,                        // Detect if a key has been pressed once
  # RayKey.down?,                           // Detect if a key is being pressed
  # RayKey.released?,                       // Detect if a key has been released once
  # RayKey.up?,                             // Detect if a key is NOT being pressed
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

  # RayTouch.gestures_enabled=              // Enable a set of gestures using flags
  # RayTouch.gesture?                       // Check if a gesture have been detected
  # RayTouch.last_gesture                   // Get latest detected gesture
  # RayTouch.points_count                   // Get touch points count
  # RayTouch.hold_duration                  // Get gesture hold time in milliseconds
  # RayTouch.drag_vector                    // Get gesture drag vector
  # RayTouch.drag_angle                     // Get gesture drag angle
  # RayTouch.pinch_vector                   // Get gesture pinch delta
  # RayTouch.pinch_angle                    // Get gesture pinch angle

  #------------------------------------------------------------------------------------
  # Camera System Functions (Module: camera)
  #------------------------------------------------------------------------------------

  # RayCamera#mode=                             // Set camera mode (multiple camera modes available)
  # RayCamera#update                            // Update camera position for selected mode

  # RayCamera.pan_control=                      // Set camera pan key to combine with mouse movement (free camera)
  # RayCamera.alt_control=                      // Set camera alt key to combine with mouse movement (free camera)
  # RayCamera.smooth_zoom_control=              // Set camera smooth zoom key to combine with mouse (free camera)
  # RayCamera.set_move_controls                 // Set camera move controls (1st person and 3rd person cameras)

  #------------------------------------------------------------------------------------
  # Basic Shapes Drawing Functions (Module: shapes)
  #------------------------------------------------------------------------------------

  # // Basic shapes drawing functions
  # RayDraw.pixel                               // Draw a pixel
  # RayDraw.pixel_v                             // Draw a pixel (Vector version)
  # RayDraw.line                                // Draw a line
  # RayDraw.line_v                              // Draw a line (Vector version)
  # RayDraw.line_ex                             // Draw a line defining thickness
  # RayDraw.line_bezier                         // Draw a line using cubic-bezier curves in-out
  # RayDraw.line_strip                          // Draw lines sequence
  # RayDraw.circle                              // Draw a color-filled circle
  # RayDraw.circle_sector                       // Draw a piece of a circle
  # RayDraw.circle_sector_lines                 // Draw circle sector outline
  # RayDraw.circle_gradient                     // Draw a gradient-filled circle
  # RayDraw.circle_v                            // Draw a color-filled circle (Vector version)
  # RayDraw.circle_lines                        // Draw circle outline
  # RayDraw.ring                                // Draw ring
  # RayDraw.ring_lines                          // Draw ring outline
  # RayDraw.rectangle                           // Draw a color-filled rectangle
  # RayDraw.rectangle_v                         // Draw a color-filled rectangle (Vector version)
  # RayDraw.rectangle_rec                       // Draw a color-filled rectangle
  # RayDraw.rectangle_pro                       // Draw a color-filled rectangle with pro parameters
  # RayDraw.rectangle_gradient_v                // Draw a vertical-gradient-filled rectangle
  # RayDraw.rectangle_gradient_h                // Draw a horizontal-gradient-filled rectangle
  # RayDraw.rectangle_gradient_ex               // Draw a gradient-filled rectangle with custom vertex colors
  # RayDraw.rectangle_lines                     // Draw rectangle outline
  # RayDraw.rectangle_lines_ex                  // Draw rectangle outline with extended parameters
  # RayDraw.rectangle_bounded                   // Draw rectangle with rounded edges
  # RayDraw.rectangle_bounded_lines             // Draw rectangle with rounded edges outline
  # RayDraw.triangle                            // Draw a color-filled triangle (vertex in counter-clockwise order!)
  # RayDraw.triangle_lines                      // Draw triangle outline (vertex in counter-clockwise order!)
  # RayDraw.triangle_fan                        // Draw a triangle fan defined by points (first vertex is the center)
  # RayDraw.triangle_strip                      // Draw a triangle strip defined by points
  # RayDraw.poly                                // Draw a regular polygon (Vector version)

  # RayDraw.set_shapes_texture                  // Define default texture used to draw shapes

  # // Basic shapes collision detection functions
  # RayCollision.check_recs                     // Check collision between two rectangles
  # RayCollision.check_circles                  // Check collision between two circles
  # RayCollision.check_circle_rec               // Check collision between circle and rectangle
  # RayCollision.rec                            // Get collision rectangle for two rectangles collision
  # RayCollision.check_point_rec                // Check if point is inside rectangle
  # RayCollision.check_point_circle             // Check if point is inside circle
  # RayCollision.check_point_triangle           // Check if point is inside a triangle

  #------------------------------------------------------------------------------------
  # Texture Loading and Drawing Functions (Module: textures)
  #------------------------------------------------------------------------------------

  # Image/Texture2D data loading/unloading/saving functions
  # RayImage.load                               // Load image from file into CPU memory (RAM)
  # RayImage.load_ex                            // Load image from Color array data (RGBA - 32bit)
  # RayImage.load_pro                           // Load image from raw data with parameters
  # RayImage.load_raw                           // Load image from RAW file data
  # RayImage#export                             // Export image data to file
  # RayImage#export_as_code                     // Export image as code file defining an array of bytes
  # RayTexture2D#load                           // Load texture from file into GPU memory (VRAM)
  # RayImage#to_texture2d                       // Load texture from image data
  # RayImage#to_texture_cubemap                 // Load cubemap from image, multiple image cubemap layouts supported
  # RayRenderTexture2D.load                     // Load texture for rendering (framebuffer)
  # RayImage#unload                             // Unload image from CPU memory (RAM)
  # RayTexture2D#unload                         // Unload texture from GPU memory (VRAM)
  # RayRenderTexture2D#unload                   // Unload render texture from GPU memory (VRAM)
  # RayImage#to_data                            // Get pixel data from image as a Color struct array
  # RayImage#to_data_normalized                 // Get pixel data from image as Vector4 array (float normalized)
  # RayImage#alpha_border                       // Get image alpha border rectangle
  # RayImage.pixel_data_size                    // Get pixel data size in bytes (image or texture)
  # RayTexture2D#to_image                       // Get pixel data from GPU texture and return an Image
  # RayImage.screenshot                         // Get pixel data from screen buffer and return an Image (screenshot)
  # RayTexture2D#update                         // Update GPU texture with new data

  # // Image manipulation functions
  # RayImage#copy                               // Create an image duplicate (useful for transformations)
  # RayImage#image_rect                         // Create an image from another image piece
  # RayImage#pot!                               // Convert image to POT (power-of-two)
  # RayImage#format!                            // Convert image data to desired format
  # RayImage#alpha_mask!                        // Apply alpha mask to image
  # RayImage#alpha_clear!                       // Clear alpha channel to desired color
  # RayImage#alpha_crop!                        // Crop image depending on alpha value
  # RayImage#alpha_premultiply!                 // Premultiply alpha channel
  # RayImage#crop!                              // Crop an image to a defined rectangle
  # RayImage#resize!                            // Resize image (Bicubic scaling algorithm)
  # RayImage#resize_nn!                         // Resize image (Nearest-Neighbor scaling algorithm)
  # RayImage#resize_canvas!                     // Resize canvas and fill with color
  # RayImage#mipmaps!                           // Generate all mipmap levels for a provided image
  # RayImage#dither!                            // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  # RayImage#palette                            // Extract color palette from image to maximum size (memory should be freed)
  # RayImage.from_text                          // Create an image from text (default font)
  # RayImage.from_text_ex                       // Create an image from text (custom sprite font)
  # RayImage#draw!                              // Draw a source image within a destination image (tint applied to source)
  # RayImage#draw_rectangle!                    // Draw rectangle within an image
  # RayImage#draw_rectangle_lines!              // Draw rectangle lines within an image
  # RayImage#draw_text!                         // Draw text (default font) within an image (destination)
  # RayImage#draw_text_ex!                      // Draw text (custom sprite font) within an image (destination)
  # RayImage#flip_vertical!                     // Flip image vertically
  # RayImage#flip_horizontal!                   // Flip image horizontally
  # RayImage#rotate_cw!                         // Rotate image clockwise 90deg
  # RayImage#rotate_ccw!                        // Rotate image counter-clockwise 90deg
  # RayImage#color_tint!                        // Modify image color: tint
  # RayImage#color_invert!                      // Modify image color: invert
  # RayImage#color_grayscale!                   // Modify image color: grayscale
  # RayImage#color_contrast!                    // Modify image color: contrast (-100 to 100)
  # RayImage#color_brightness!                  // Modify image color: brightness (-255 to 255)
  # RayImage#color_replace!                     // Modify image color: replace color

  # // Image generation functions
  # RayImage.gen_color                          // Generate image: plain color
  # RayImage.gen_gradient_v                     // Generate image: vertical gradient
  # RayImage.gen_gradient_h                     // Generate image: horizontal gradient
  # RayImage.gen_gradient_radial                // Generate image: radial gradient
  # RayImage.gen_checked                        // Generate image: checked
  # RayImage.gen_white_noise                    // Generate image: white noise
  # RayImage.gen_perlin_noise                   // Generate image: perlin noise
  # RayImage.gen_cellular                       // Generate image: cellular algorithm. Bigger tileSize means bigger cells

  # // Texture2D configuration functions
  # RayTexture2D.mipmaps!                       // Generate GPU mipmaps for a texture
  # RayTexture2D.filter=                        // Set texture scaling filter mode
  # RayTexture2D.wrap=                          // Set texture wrapping mode

  # // Texture2D drawing functions
  # RayTexture2D#draw                           // Draw a Texture2D
  # RayTexture2D#draw_v                         // Draw a Texture2D with position defined as Vector2
  # RayTexture2D#draw_ex                        // Draw a Texture2D with extended parameters
  # RayTexture2D#draw_rec                       // Draw a part of a texture defined by a rectangle
  # RayTexture2D#draw_quad                      // Draw texture quad with tiling and offset parameters
  # RayTexture2D#draw_pro                       // Draw a part of a texture defined by a rectangle with 'pro' parameters
  # RayTexture2D#draw_n_patch                   // Draws a texture (or part of it) that stretches or shrinks nicely

  #------------------------------------------------------------------------------------
  # Font Loading and Text Drawing Functions (Module: text)
  #------------------------------------------------------------------------------------
  
  # // Font loading/unloading functions
  # RayFont.default                             // Get the default Font
  # RayFont.load                                // Load font from file into GPU memory (VRAM)
  # RayFont.load_ex                             // Load font from file with extended parameters
  # RayImage.to_font                            // Load font from Image (XNA style)
  # RayFont.load_data                           // Load font data for further use
  # RayFont.image_atlas                         // Generate image font atlas using chars info
  # RayFont#unload                              // Unload Font from GPU memory (VRAM)

  # // Text drawing functions
  # RayDraw.fps                                 // Shows current FPS
  # RayDraw.text                                // Draw text (using default font)
  # RayDraw.text_ex                             // Draw text using font and additional parameters
  # RayDraw.text_rec                            // Draw text using font inside rectangle limits
  # RayDraw.text_rec_ex                         // Draw text using font inside rectangle limits with support for text selection
  # RayDraw.text_codepoint                      // Draw one character (codepoint)

  # // Text misc. functions
  # RayFont.measure_text                        // Measure string width for default font
  # RayFont.measure_text                        // Measure string size for Font
  # RayFont.glyph_index                         // Get index position for a unicode character on font

  # // Text strings management functions
  # raylib-ruby NOTICE: Just use ruby code

  # // UTF8 text strings management functions
  # raylib-ruby NOTICE: Just use ruby code

  #------------------------------------------------------------------------------------
  # Basic 3d Shapes Drawing Functions (Module: models)
  #------------------------------------------------------------------------------------

  # // Basic geometric 3D shapes drawing functions
  # RayDraw.line_3d                             // Draw a line in 3D world space
  # RayDraw.circle_3d                           // Draw a circle in 3D world space
  # RayDraw.cube                                // Draw cube
  # RayDraw.cube_v                              // Draw cube (Vector version)
  # RayDraw.cube_wires                          // Draw cube wires
  # RayDraw.cube_wires_v                        // Draw cube wires (Vector version)
  # RayDraw.cube_texture                        // Draw cube textured
  # RayDraw.sphere                              // Draw sphere
  # RayDraw.sphere_ex                           // Draw sphere with extended parameters
  # RayDraw.sphere_wires                        // Draw sphere wires
  # RayDraw.cylinder                            // Draw a cylinder/cone
  # RayDraw.cylinder_wires                      // Draw a cylinder/cone wires
  # RayDraw.plane                               // Draw a plane XZ
  # RayDraw.ray                                 // Draw a ray line
  # RayDraw.grid                                // Draw a grid (centered at (0, 0, 0))
  # RayDraw.gizmo                               // Draw simple gizmo

  #------------------------------------------------------------------------------------
  # Model 3d Loading and Drawing Functions (Module: models)
  #------------------------------------------------------------------------------------

  # // Model loading/unloading functions
  # RayModel.load                               // Load model from files (meshes and materials)
  # RayMesh#to_model                            // Load model from generated mesh (default material)
  # RayModel#unload                             // Unload model from memory (RAM and/or VRAM)

  # Mesh loading/unloading functions
  # RayMesh.load                                // Load meshes from model file
  # RayMesh#export                              // Export mesh data to file
  # RayMesh#unload                              // Unload mesh from memory (RAM and/or VRAM)

  # // Material loading/unloading functions
  # RayMaterial.load                            // Load materials from model file
  # RayMaterial.load_default                    // Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  # RayMaterial#unload                          // Unload material from GPU memory (VRAM)
  # RayMaterial#set_texture                     // Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
  # RayModel#set_mesh_material                  // Set material for a mesh

  # // Model animations loading/unloading functions
  # RayModelAnimation.load                      // Load model animations from file
  # RayModel#update_animation                   // Update model animation pose
  # RayModelAnimation#unload                    // Unload animation data
  # RayModel#valid_animation?                   // Check model animation skeleton match

  # // Mesh generation functions
  # RayMesh.gen_poly                            // Generate polygonal mesh
  # RayMesh.gen_plane                           // Generate plane mesh (with subdivisions)
  # RayMesh.gen_cube                            // Generate cuboid mesh
  # RayMesh.gen_sphere                          // Generate sphere mesh (standard sphere)
  # RayMesh.gen_hemisphere                      // Generate half-sphere mesh (no bottom cap)
  # RayMesh.gen_cylinder                        // Generate cylinder mesh
  # RayMesh.gen_torus                           // Generate torus mesh
  # RayMesh.gen_knot                            // Generate trefoil knot mesh
  # RayMesh.gen_heightmap                       // Generate heightmap mesh from image data
  # RayMesh.gen_cubicmap                        // Generate cubes-based map mesh from image data

  # // Mesh manipulation functions
  # RayMesh#bounding_box                        // Compute mesh bounding box limits
  # RayMesh#tangents                            // Compute mesh tangents
  # RayMesh#binormals                           // Compute mesh binormals

  # // Model drawing functions
  ray_static :DrawModel,                (Model model, Vector3 position, float scale, Color tint);                           // Draw a model (with texture if set)
  ray_static :DrawModelEx,                (Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model with extended parameters
  ray_static :DrawModelWires,                 (Model model, Vector3 position, float scale, Color tint);                      // Draw a model wires (with texture if set)
  ray_static :DrawModelWiresEx,                 (Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model wires (with texture if set) with extended parameters
  ray_static :DrawBoundingBox,                (BoundingBox box, Color color);                                               // Draw bounding box (wires)
  ray_static :DrawBillboard,                (Camera camera, Texture2D texture, Vector3 center, float size, Color tint);     // Draw a billboard texture
  ray_static :DrawBillboardRec,                 (Camera camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint); // Draw a billboard texture defined by sourceRec

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
