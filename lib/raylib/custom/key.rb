module Raylib
  class Key
    # Input-related functions: keyboard
    ray_alias_static :IsKeyPressed,   :is_pressed?    # Detect if a key has been pressed once
    ray_alias_static :IsKeyDown,      :is_down?       # Detect if a key is being pressed
    ray_alias_static :IsKeyReleased,  :is_released?   # Detect if a key has been released once
    ray_alias_static :IsKeyUp,        :is_up?         # Detect if a key is NOT being pressed
    ray_alias_static :GetKeyPressed,  :key_pressed    # Get latest key pressed
    ray_alias_static :SetExitKey,     :exit_key=      # Set a custom key to exit program (default is ESC)
  end
end
