module Raylib
  # Gestures type
  # NOTE: It could be used as flags to enable only some gestures
  GestureType = enum(
    :none,            0,
    :tap,             1,
    :doubletap,       2,
    :hold,            4,
    :drag,            8,
    :swipe_right,    16,
    :swipe_left,     32,
    :swipe_up,       64,
    :swipe_down,    128,
    :pinch_in,      256,
    :pinch_out,     512
  )
end
