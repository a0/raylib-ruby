module Raylib
  class Touch
    # Input-related functions: touch
    ray_alias_static :GetTouchX,              :x                # Returns touch position X for touch point 0 (relative to screen size)
    ray_alias_static :GetTouchY,              :y                # Returns touch position Y for touch point 0 (relative to screen size)
    ray_alias_static :GetTouchPosition,       :position         # Returns touch position XY for a touch point index (relative to screen size)

    # Gestures and Touch Handling Functions (Module: gestures)
    ray_alias_static :SetGesturesEnabled,     :gestures=        # Enable a set of gestures using flags
    ray_alias_static :IsGestureDetected,      :is_gesture?      # Check if a gesture have been detected
    ray_alias_static :GetGestureDetected,     :gesture          # Get latest detected gesture
    ray_alias_static :GetTouchPointsCount,    :points_count     # Get touch points count
    ray_alias_static :GetGestureHoldDuration, :hold_duration    # Get gesture hold time in milliseconds
    ray_alias_static :GetGestureDragVector,   :drag_vector      # Get gesture drag vector
    ray_alias_static :GetGestureDragAngle,    :drag_angle       # Get gesture drag angle
    ray_alias_static :GetGesturePinchVector,  :pinch_vector     # Get gesture pinch delta
    ray_alias_static :GetGesturePinchAngle,   :pinch_angle      # Get gesture pinch angle

    # Shader loading/unloading functions
    ray_alias_static :GetTextureDefault,      :default # Get default texture
  end
end
