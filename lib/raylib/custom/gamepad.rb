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

    # # // This is here just for error checking
    # @nn = -1
    # GAMEPAD_BUTTON_UNKNOWN = (@nn+=0)

    # # // This is normally [A,B,X,Y]/[Circle,Triangle,Square,Cross]
    # # // No support for 6 button controllers though..
    # GAMEPAD_BUTTON_LEFT_FACE_UP = (@nn+=0)
    # GAMEPAD_BUTTON_LEFT_FACE_RIGHT = (@nn+=0)
    # GAMEPAD_BUTTON_LEFT_FACE_DOWN = (@nn+=0)
    # GAMEPAD_BUTTON_LEFT_FACE_LEFT = (@nn+=0)
  
    # # // This is normally a DPAD
    # GAMEPAD_BUTTON_RIGHT_FACE_UP = (@nn+=0)
    # GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = (@nn+=0)
    # GAMEPAD_BUTTON_RIGHT_FACE_DOWN = (@nn+=0)
    # GAMEPAD_BUTTON_RIGHT_FACE_LEFT = (@nn+=0)

    # # // Triggers
    # GAMEPAD_BUTTON_LEFT_TRIGGER_1 = (@nn+=0)
    # GAMEPAD_BUTTON_LEFT_TRIGGER_2 = (@nn+=0)
    # GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = (@nn+=0)
    # GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = (@nn+=0)

    # # // These are buttons in the center of the gamepad
    # GAMEPAD_BUTTON_MIDDLE_LEFT = (@nn+=0)    # //PS3 Select
    # GAMEPAD_BUTTON_MIDDLE = (@nn+=0)         # //PS Button/XBOX Button
    # GAMEPAD_BUTTON_MIDDLE_RIGHT = (@nn+=0)   # //PS3 Start

    # # // These are the joystick press in buttons
    # GAMEPAD_BUTTON_LEFT_THUMB = (@nn+=0)
    # GAMEPAD_BUTTON_RIGHT_THUMB = (@nn+=0)

  end
end
