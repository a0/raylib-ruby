module Raylib
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
end
