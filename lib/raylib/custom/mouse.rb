module Raylib
  class Mouse
    # Input-related functions: mouse
    ray_alias_static :IsMouseButtonPressed,   :is_button_pressed?   # Detect if a mouse button has been pressed once
    ray_alias_static :IsMouseButtonDown,      :is_button_down?      # Detect if a mouse button is being pressed
    ray_alias_static :IsMouseButtonReleased,  :is_button_released?  # Detect if a mouse button has been released once
    ray_alias_static :IsMouseButtonUp,        :is_button_up?        # Detect if a mouse button is NOT being pressed
    ray_alias_static :GetMouseX,              :x                    # Returns mouse position X
    ray_alias_static :GetMouseY,              :y                    # Returns mouse position Y
    ray_alias_static :GetMousePosition,       :position             # Returns mouse position XY
    ray_alias_static :SetMousePosition,       :position=            # Set mouse position XY
    ray_alias_static :SetMouseScale,          :scale=               # Set mouse scaling
    ray_alias_static :GetMouseWheelMove,      :wheel_move           # Returns mouse wheel movement Y
  end
end
