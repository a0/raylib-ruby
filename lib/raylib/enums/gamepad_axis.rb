module Raylib
  GamepadAxis = enum(
    # This is here just for error checking
    :unknown,   0,
    # Left stick
    :left_x,
    :left_y,
    # Right stick
    :right_x,
    :right_y,
    # Pressure levels for the back triggers
    :left_trigger,    # [1..-1] (pressure-level)
    :right_trigger    # [1..-1] (pressure-level)
  )
end
