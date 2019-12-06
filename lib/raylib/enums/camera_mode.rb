module Raylib
  # Camera system modes
  CameraMode = enum(
    :custom, 0,
    :free,
    :orbital,
    :first_person,
    :third_person
  )
end
