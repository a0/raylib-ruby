module Raylib
  class Gamepad
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Input Handling Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Input-related functions: gamepads
    ray_static :IsGamepadAvailable,       :available?,          [GamepadNumber], :bool                  # Detect if a gamepad is available
    ray_static :IsGamepadName,            :name?,               [GamepadNumber, :string], :bool         # Check gamepad name (if available)
    ray_static :GetGamepadName,           :name,                [GamepadNumber], :string                # Return gamepad internal name id
    ray_static :IsGamepadButtonPressed,   :button_pressed?,     [GamepadNumber, GamepadButton], :bool   # Detect if a gamepad button has been pressed once
    ray_static :IsGamepadButtonDown,      :button_down?,        [GamepadNumber, GamepadButton], :bool   # Detect if a gamepad button is being pressed
    ray_static :IsGamepadButtonReleased,  :button_released?,    [GamepadNumber, GamepadButton], :bool   # Detect if a gamepad button has been released once
    ray_static :IsGamepadButtonUp,        :button_up?,          [GamepadNumber, GamepadButton], :bool   # Detect if a gamepad button is NOT being pressed
    ray_static :GetGamepadButtonPressed,  :last_button_pressed, [:void], GamepadButton                  # Get the last gamepad button pressed
    ray_static :GetGamepadAxisCount,      :axis_count,          [GamepadNumber], :int                   # Return gamepad axis count for a gamepad
    ray_static :GetGamepadAxisMovement,   :axis_movement,       [GamepadNumber, GamepadAxis], :float    # Return axis movement value for a gamepad axis
  end
end
