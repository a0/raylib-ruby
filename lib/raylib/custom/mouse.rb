module Raylib
  class Mouse
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Input Handling Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Input-related functions: mouse
    ray_static  :IsMouseButtonPressed,  :button_pressed?,   [MouseButton], :bool      # Detect if a mouse button has been pressed once
    ray_static  :IsMouseButtonDown,     :button_down?,      [MouseButton], :bool      # Detect if a mouse button is being pressed
    ray_static  :IsMouseButtonReleased, :button_released?,  [MouseButton], :bool      # Detect if a mouse button has been released once
    ray_static  :IsMouseButtonUp,       :button_up?,        [MouseButton], :bool      # Detect if a mouse button is NOT being pressed
    ray_static  :GetMouseX,             :x,                 [], :int                  # Returns mouse position X
    ray_static  :GetMouseY,             :y,                 [], :int                  # Returns mouse position Y
    ray_static  :GetMousePosition,      :position,          [], Vector2.by_value      # Returns mouse position XY
    ray_static  :SetMousePosition,      :set_position,      %i[int int], :void        # Set mouse position XY
    ray_static  :SetMouseOffset,        :set_offset,        %i[int int], :void        # Set mouse offset
    ray_static  :SetMouseScale,         :set_scale,         %i[float float], :void    # Set mouse scaling
    ray_static  :GetMouseWheelMove,     :wheel_move,        [], :int                  # Returns mouse wheel movement Y
  end
end
