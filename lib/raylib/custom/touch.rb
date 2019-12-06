module Raylib
  class Touch
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Input Handling Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Input-related functions: touch
    ray_static :GetTouchX,        :x,         [], :int                    # Returns touch position X for touch point 0 (relative to screen size)
    ray_static :GetTouchY,        :y,         [], :int                    # Returns touch position Y for touch point 0 (relative to screen size)
    ray_static :GetTouchPosition, :position,  %i[int], Vector2.by_value   # Returns touch position XY for a touch point index (relative to screen size)

    #------------------------------------------------------------------------------------
    # Gestures and Touch Handling Functions (Module: gestures)
    #------------------------------------------------------------------------------------

    ray_static :SetGesturesEnabled,     :gestures=,     %i[uint], :void         # Enable a set of gestures using flags
    ray_static :IsGestureDetected,      :gesture?,      [GestureType], :bool    # Check if a gesture have been detected
    ray_static :GetGestureDetected,     :gesture,       [], :int                # Get latest detected gesture
    ray_static :GetTouchPointsCount,    :points_count,  [], :int                # Get touch points count
    ray_static :GetGestureHoldDuration, :hold_duration, [], :float              # Get gesture hold time in milliseconds
    ray_static :GetGestureDragVector,   :drag_vector,   [], Vector2.by_value    # Get gesture drag vector
    ray_static :GetGestureDragAngle,    :drag_angle,    [], :float              # Get gesture drag angle
    ray_static :GetGesturePinchVector,  :pinch_vector,  [], Vector2.by_value    # Get gesture pinch delta
    ray_static :GetGesturePinchAngle,   :pinch_angle,   [], :float              # Get gesture pinch angle
  end
end
