module Raylib
  class Window
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Window-related functions
    ray_static :InitWindow,         :init,              %i[int int string], :void   # Initialize window and OpenGL context
    ray_static :WindowShouldClose,  :should_close?,     [], :bool                   # Check if KEY_ESCAPE pressed or Close icon pressed
    ray_static :CloseWindow,        :close,             [], :void                   # Close window and unload OpenGL context
    ray_static :IsWindowReady,      :ready?,            [], :bool                   # Check if window has been initialized successfully
    ray_static :IsWindowMinimized,  :minimized?,        [], :bool                   # Check if window has been minimized (or lost focus)
    ray_static :IsWindowResized,    :resized?,          [], :bool                   # Check if window has been resized
    ray_static :IsWindowHidden,     :hidden?,           [], :bool                   # Check if window is currently hidden
    ray_static :ToggleFullscreen,   :toggle_fullscreen, [], :bool                   # Toggle fullscreen mode (only PLATFORM_DESKTOP)
    ray_static :UnhideWindow,       :unhide,            [], :void                   # Show the window
    ray_static :HideWindow,         :hide,              [], :void                   # Hide the window
    ray_static :SetWindowIcon,      :icon=,             [Image.by_value], :void     # Set icon for window (only PLATFORM_DESKTOP)
    ray_static :SetWindowTitle,     :title=,            %i[string], :void           # Set title for window (only PLATFORM_DESKTOP)
    ray_static :SetWindowPosition,  :set_position,      %i[int int], :void          # Set window position on screen (only PLATFORM_DESKTOP)
    ray_static :SetWindowMonitor,   :monitor=,          %i[int], :void              # Set monitor for the current window (fullscreen mode)
    ray_static :SetWindowMinSize,   :set_min_size,      %i[int int], :void          # Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    ray_static :SetWindowSize,      :set_size,          %i[int int], :void          # Set window dimensions
    ray_static :GetWindowHandle,    :handle,            [], :pointer                # Get native window handle
    ray_static :GetScreenWidth,     :width,             [], :int                    # Get current screen width
    ray_static :GetScreenHeight,    :height,            [], :int                    # Get current screen height

    ray_static :GetWindowPosition,  :position,          [], Vector2.by_value        # Get window position XY on monitor

    # Timming-related functions
    ray_static :SetTargetFPS,       :target_fps=,       [:int], :void               # Set target FPS (maximum)
    ray_static :GetFPS,             :fps,               [], :int                    # Returns current FPS
    ray_static :GetFrameTime,       :time_since_frame,  [], :float                  # Returns time in seconds for last frame drawn
    ray_static :GetTime,            :time_since_init,   [], :double                 # Returns elapsed time in seconds since InitWindow()
  end
end
