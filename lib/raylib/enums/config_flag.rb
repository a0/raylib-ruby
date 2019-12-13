module Raylib
  # System config flags
  # NOTE: Used for bit masks
  # rubocop:disable Layout/ExtraSpacing
  ConfigFlag = enum(
    :show_logo,             1,    # Set to show raylib logo at startup
    :fullscreen_mode,       2,    # Set to run program in fullscreen
    :window_resizable,      4,    # Set to allow resizable window
    :window_undecorated,    8,    # Set to disable window decoration (frame and buttons)
    :window_transparent,   16,    # Set to allow transparent window
    :window_hidden,       128,    # Set to create the window initially hidden
    :window_always_run,   256,    # Set to allow windows running while minimized
    :msaa_4x_hint,         32,    # Set to try enabling MSAA 4X
    :vsync_hint,           64     # Set to try enabling V-Sync on GPU
  )
  # rubocop:enable Layout/ExtraSpacing
end
