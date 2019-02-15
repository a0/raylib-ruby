module Raylib
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
end
