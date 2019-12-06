module Raylib
  # raylib-ruby NOTE: Key is a enum instance, so we open the singleton class to define methods here.
  class << Key
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Input Handling Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Input-related functions: keyboard
    ray_static :IsKeyPressed,   :is_pressed?,   [Key], :bool, self    # Detect if a key has been pressed once
    ray_static :IsKeyDown,      :is_down?,      [Key], :bool, self    # Detect if a key is being pressed
    ray_static :IsKeyReleased,  :is_released?,  [Key], :bool, self    # Detect if a key has been released once
    ray_static :IsKeyUp,        :is_up?,        [Key], :bool, self    # Detect if a key is NOT being pressed
    ray_static :SetExitKey,     :exit_key=,     [Key], :void, self    # Set a custom key to exit program (default is ESC)
    ray_static :GetKeyPressed,  :key_pressed,   [], Key,      self    # Get key pressed, call it multiple times for chars queued
  end
end
