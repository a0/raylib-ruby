module Raylib
  class Camera2D
    # Initialize 2D mode with custom camera (2D)
    def begin_mode32
      Raylib.BeginMode2D self
      yield
      self.class.end_mode2d
    end

    ray_alias_static :EndMode2D, :end_mode2d # Ends 2D mode with custom camera
  end

  class Camera3D
    # Initializes 3D mode with custom camera (3D)
    def begin_mode3d
      Raylib.BeginMode3D self
      yield
      self.class.end_mode3d
    end

    ray_alias_static :EndMode3D, :end_mode3d # Ends 3D mode and returns to default 2D orthographic mode

    # Screen-space-related functions
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
    ray_alias_static :CheckCollisionRecs, :check_recs                    # Check collision between two rectangles
    ray_alias_static :CheckCollisionCircles, :check_circles              # Check collision between two circles
    ray_alias_static :CheckCollisionCircleRec, :check_circle_rec         # Check collision between circle and rectangle
    ray_alias_static :GetCollisionRec, :get_rec                          # Get collision rectangle for two rectangles collision
    ray_alias_static :CheckCollisionPointRec, :check_point_rec           # Check if point is inside rectangle
    ray_alias_static :CheckCollisionPointCircle, :check_point_circle     # Check if point is inside circle
    ray_alias_static :CheckCollisionPointTriangle, :check_point_triangle # Check if point is inside a triangle
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
    ray_alias_static :ShowCursor, :show            # Shows cursor
    ray_alias_static :HideCursor, :hide            # Hides cursor
    ray_alias_static :IsCursorHidden, :is_hidden?  # Check if cursor is not visible
    ray_alias_static :EnableCursor, :enable        # Enables cursor (unlock cursor)
    ray_alias_static :DisableCursor, :disable      # Disables cursor (lock cursor)
  end

  class Draw
    # Drawing-related functions
    ray_alias_static :ClearBackground, :clear_background   # Set background color (framebuffer clear color)
    ray_alias_static :EndDrawing, :end_drawing             # End canvas drawing and swap buffers (double buffering)

    # Setup canvas (framebuffer) to start drawing
    def self.begin_drawing
      Raylib.BeginDrawing
      return unless block_given?

      yield
      end_drawing
    end

    # Basic shapes drawing functions
    ray_alias_static :DrawPixel,               :pixel                  # Draw a pixel
    ray_alias_static :DrawPixelV,              :pixel_v                # Draw a pixel (Vector version)
    ray_alias_static :DrawLine,                :line                   # Draw a line
    ray_alias_static :DrawLineV,               :line_v                 # Draw a line (Vector version)
    ray_alias_static :DrawLineEx,              :line_ex                # Draw a line defining thickness
    ray_alias_static :DrawLineBezier,          :line_bezier            # Draw a line using cubic-bezier curves in-out
    ray_alias_static :DrawCircle,              :circle                 # Draw a color-filled circle
    ray_alias_static :DrawCircleGradient,      :circle_gradient        # Draw a gradient-filled circle
    ray_alias_static :DrawCircleV,             :circle_v               # Draw a color-filled circle (Vector version)
    ray_alias_static :DrawCircleLines,         :circle_lines           # Draw circle outline
    ray_alias_static :DrawRectangle,           :rectangle              # Draw a color-filled rectangle
    ray_alias_static :DrawRectangleV,          :rectangle_v            # Draw a color-filled rectangle (Vector version)
    ray_alias_static :DrawRectangleRec,        :rectangle_rec          # Draw a color-filled rectangle
    ray_alias_static :DrawRectanglePro,        :rectangle_pro          # Draw a color-filled rectangle with pro parameters
    ray_alias_static :DrawRectangleGradientV,  :rectangle_gradient_v   # Draw a vertical-gradient-filled rectangle
    ray_alias_static :DrawRectangleGradientH,  :rectangle_gradient_h   # Draw a horizontal-gradient-filled rectangle
    ray_alias_static :DrawRectangleGradientEx, :rectangle_gradient_ex  # Draw a gradient-filled rectangle with custom vertex colors
    ray_alias_static :DrawRectangleLines,      :rectangle_lines        # Draw rectangle outline
    ray_alias_static :DrawRectangleLinesEx,    :rectangle_lines_ex     # Draw rectangle outline with extended parameters
    ray_alias_static :DrawTriangle,            :triangle               # Draw a color-filled triangle
    ray_alias_static :DrawTriangleLines,       :triangle_lines         # Draw triangle outline
    ray_alias_static :DrawPoly,                :poly                   # Draw a regular polygon (Vector version)
    ray_alias_static :DrawPolyEx,              :poly_ex                # Draw a closed polygon defined by points
    ray_alias_static :DrawPolyExLines,         :poly_ex_lines          # Draw polygon lines

    ray_alias_static :DrawFPS,                  :fps
    ray_alias_static :DrawText,                 :text
    ray_alias_static :MeasureText,              :measure_text
    ray_alias_static :DrawModel,                :model
    ray_alias_static :DrawBillboard,            :billboard
    ray_alias_static :DrawBillboardRec,         :billboard_rec
    ray_alias_static :DrawGrid,                 :grid
    ray_alias_static :DrawCircleV,              :circle_v
    ray_alias_static :DrawTriangle,             :triangle
    ray_alias_static :EndBlendMode,             :end_blend_mode

    class << self
      def begin_blend_mode(mode)
        Raylib.BeginBlendMode mode
        return unless block_given?

        yield
        end_blend_mode
      end
    end
  end

  class Gamepad
    # Input-related functions: gamepads
    ray_alias_static :IsGamepadAvailable, :is_available?             # Detect if a gamepad is available
    ray_alias_static :IsGamepadName, :is_name?                       # Check gamepad name (if available)
    ray_alias_static :GetGamepadName, :name                          # Return gamepad internal name id
    ray_alias_static :IsGamepadButtonPressed, :is_button_pressed?    # Detect if a gamepad button has been pressed once
    ray_alias_static :IsGamepadButtonDown, :is_button_down?          # Detect if a gamepad button is being pressed
    ray_alias_static :IsGamepadButtonReleased, :is_button_released?  # Detect if a gamepad button has been released once
    ray_alias_static :IsGamepadButtonUp, :is_button_up?              # Detect if a gamepad button is NOT being pressed
    ray_alias_static :GetGamepadButtonPressed, :button_pressed       # Get the last gamepad button pressed
    ray_alias_static :GetGamepadAxisCount, :axis_count               # Return gamepad axis count for a gamepad
    ray_alias_static :GetGamepadAxisMovement, :axis_movement         # Return axis movement value for a gamepad axis
  end

  class Image
    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadImage,     :load       # Load image from file into CPU memory (RAM)
    ray_alias_static :LoadImageEx,   :load_ex    # Load image from Color array data (RGBA - 32bit)
    ray_alias_static :LoadImagePro,  :load_pro   # Load image from raw data with parameters
    ray_alias_static :LoadImageRaw,  :load_raw   # Load image from RAW file data

    # Image manipulation functions
    ray_alias_object  :ImageCopy,             :copy               # Create an image duplicate (useful for transformations)
    ray_alias_object  :ImageToPOT,            :pot!               # Convert image to POT (power-of-two)
    ray_alias_object  :ImageFormat,           :format!            # Convert image data to desired format
    ray_alias_object  :ImageAlphaMask,        :alpha_mask!        # Apply alpha mask to image
    ray_alias_object  :ImageAlphaClear,       :alpha_clear!       # Clear alpha channel to desired color
    ray_alias_object  :ImageAlphaCrop,        :alpha_crop!        # Crop image depending on alpha value
    ray_alias_object  :ImageAlphaPremultiply, :alpha_premultiply! # Premultiply alpha channel
    ray_alias_object  :ImageCrop,             :crop!              # Crop an image to a defined rectangle
    ray_alias_object  :ImageResize,           :resize!            # Resize image (bilinear filtering)
    ray_alias_object  :ImageResizeNN,         :resize_nn!         # Resize image (Nearest-Neighbor scaling algorithm)
    ray_alias_object  :ImageResizeCanvas,     :resize_canvas!     # Resize canvas and fill with color
    ray_alias_object  :ImageMipmaps,          :gen_mipmaps!       # Generate all mipmap levels for a provided image
    ray_alias_object  :ImageDither,           :dither!            # Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    ray_alias_static :ImageText,             :from_text          # Create an image from text (default font)
    ray_alias_static :ImageTextEx,           :from_text_ex       # Create an image from text (custom sprite font)
    ray_alias_object  :ImageDraw,             :draw!              # Draw a source image within a destination image
    ray_alias_object  :ImageDrawRectangle,    :draw_rectangle!    # Draw rectangle within an image
    ray_alias_object  :ImageDrawText,         :draw_text!         # Draw text (default font) within an image (destination)
    ray_alias_object  :ImageDrawTextEx,       :draw_text_ex!      # Draw text (custom sprite font) within an image (destination)
    ray_alias_object  :ImageFlipVertical,     :flip_vertical!     # Flip image vertically
    ray_alias_object  :ImageFlipHorizontal,   :flip_horizontal!   # Flip image horizontally
    ray_alias_object  :ImageRotateCW,         :rotate_cw!         # Rotate image clockwise 90deg
    ray_alias_object  :ImageRotateCCW,        :rotate_ccw!        # Rotate image counter-clockwise 90deg
    ray_alias_object  :ImageColorTint,        :color_tint!        # Modify image color: tint
    ray_alias_object  :ImageColorInvert,      :color_invert!      # Modify image color: invert
    ray_alias_object  :ImageColorGrayscale,   :color_grayscale!   # Modify image color: grayscale
    ray_alias_object  :ImageColorContrast,    :color_contrast!    # Modify image color: contrast (-100 to 100)
    ray_alias_object  :ImageColorBrightness,  :color_brightness!  # Modify image color: brightness (-255 to 255)
    ray_alias_object  :ImageColorReplace,     :color_replace!     # Modify image color: replace color

    ray_alias_object :ExportImage, :export                        # Export image as a PNG file
    ray_alias_object :LoadTextureFromImage, :to_texture2d         # Load texture from image data
    ray_alias_object :UnloadImage, :unload                        # Unload image from CPU memory (RAM)
    ray_alias_object :GetImageData, :to_data                      # Get pixel data from image as a Color struct array
    ray_alias_object :GetImageDataNormalized, :to_data_normalized # Get pixel data from image as Vector4 array (float normalized)

    ray_alias_static :GetPixelDataSize, :pixel_data_size          # Get pixel data size in bytes (image or texture)
  end

  class Key
    # Input-related functions: keyboard
    ray_alias_static :IsKeyPressed, :is_pressed?     # Detect if a key has been pressed once
    ray_alias_static :IsKeyDown, :is_down?           # Detect if a key is being pressed
    ray_alias_static :IsKeyReleased, :is_released?   # Detect if a key has been released once
    ray_alias_static :IsKeyUp, :is_up?               # Detect if a key is NOT being pressed
    ray_alias_static :GetKeyPressed, :key_pressed    # Get latest key pressed
    ray_alias_static :SetExitKey, :exit_key=         # Set a custom key to exit program (default is ESC)
  end

  class Model
    ray_alias_static :LoadModel, :load
    ray_alias_object :UnloadModel, :unload
  end

  class Mouse
    # Screen-space-related functions
    ray_alias_static :GetMouseRay, :get_ray # Returns a ray trace from mouse position

    # Input-related functions: mouse
    ray_alias_static :IsMouseButtonPressed, :is_button_pressed?    # Detect if a mouse button has been pressed once
    ray_alias_static :IsMouseButtonDown, :is_button_down?          # Detect if a mouse button is being pressed
    ray_alias_static :IsMouseButtonReleased, :is_button_released?  # Detect if a mouse button has been released once
    ray_alias_static :IsMouseButtonUp, :is_button_up?              # Detect if a mouse button is NOT being pressed
    ray_alias_static :GetMouseX, :x                                # Returns mouse position X
    ray_alias_static :GetMouseY, :y                                # Returns mouse position Y
    ray_alias_static :GetMousePosition, :position                  # Returns mouse position XY
    ray_alias_static :SetMousePosition, :position=                 # Set mouse position XY
    ray_alias_static :SetMouseScale, :scale=                       # Set mouse scaling
    ray_alias_static :GetMouseWheelMove, :wheel_move               # Returns mouse wheel movement Y
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
    ray_alias_static :LoadRenderTexture,   :load     # Load texture for rendering (framebuffer)
    ray_alias_object  :UnloadRenderTexture, :unload   # Unload render texture from GPU memory (VRAM)
  end

  class Texture2D
    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadTexture,           :load             # Load texture from file into GPU memory (VRAM)
    ray_alias_static :LoadTextureFromImage,  :load_from_image  # Load texture from image data
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

  class Window
    # Window-related functions
    ray_alias_static :InitWindow, :init                      # Initialize window and OpenGL context
    ray_alias_static :CloseWindow, :close                    # Close window and unload OpenGL context
    ray_alias_static :IsWindowReady, :is_ready?              # Check if window has been initialized successfully
    ray_alias_static :WindowShouldClose, :should_close?      # Check if KEY_ESCAPE pressed or Close icon pressed
    ray_alias_static :IsWindowMinimized, :is_minimized?      # Check if window has been minimized (or lost focus)
    ray_alias_static :ToggleFullscreen, :toggle_fullscreen   # Toggle fullscreen mode (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowIcon, :icon=                  # Set icon for window (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowTitle, :title=                # Set title for window (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowPosition, :set_position       # Set window position on screen (only PLATFORM_DESKTOP)
    ray_alias_static :SetWindowMonitor, :monitor=            # Set monitor for the current window (fullscreen mode)
    ray_alias_static :SetWindowMinSize, :set_min_size        # Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    ray_alias_static :SetWindowSize, :set_size               # Set window dimensions
    ray_alias_static :GetScreenWidth, :width                 # Get current screen width
    ray_alias_static :GetScreenHeight, :height               # Get current screen height
  end

  # Timming-related functions
  Raylib.singleton_class.send :alias_method, :target_fps=,      :SetTargetFPS     # Set target FPS (maximum)
  Raylib.singleton_class.send :alias_method, :fps,              :GetFPS           # Returns current FPS
  Raylib.singleton_class.send :alias_method, :frame_time,       :GetFrameTime     # Returns time in seconds for last frame drawn
  Raylib.singleton_class.send :alias_method, :time,             :GetTime          # Returns elapsed time in seconds since InitWindow()

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
end
