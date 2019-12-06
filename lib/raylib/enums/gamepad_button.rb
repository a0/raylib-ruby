module Raylib
  # Gamepad buttons
  GamepadButton = enum(
    # This is here just for error checking
    :unknown,   0,
    :left_face_up,
    :left_face_right,
    :left_face_down,
    :left_face_left,
    # This normally corresponds with PlayStation and Xbox controllers
    # XBOX: [Y,X,A,B]
    # PS3: [Triangle,Square,Cross,Circle]
    # No support for 6 button controllers though..
    :right_face_up,
    :right_face_right,
    :right_face_down,
    :right_face_left,
    # Triggers
    :left_trigger_1,
    :left_trigger_2,
    :right_triggger_1,
    :right_trigger_2,
    # These are buttons in the center of the gamepad
    :middle_left,   # PS3 Select
    :middle,        # PS Button/XBOX Button
    :middle_right,  # PS3 Start
    # These are the joystick press in buttons
    :left_thumb,
    :right_thumb
  )
end
