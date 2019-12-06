module Raylib
  class Camera3D
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Drawing-related functions
    ray_object :BeginMode3D,  :begin_mode3d,  [Camera3D.by_value], :void    # Initializes 3D mode with custom camera (3D)
    ray_object :EndMode3D,    :end_mode3d,    [], :void                     # Ends 3D mode and returns to default 2D orthographic mode

    # Screen-space-related functions
    ray_object :GetMouseRay,      :ray,             [Vector2.by_value, Camera.by_value], Ray.by_value, :last        # Returns a ray trace from mouse position
    ray_object :GetCameraMatrix,  :matrix,          [Camera.by_value], Matrix.by_value                              # Returns camera transform matrix (view matrix)
    ray_object :GetWorldToScreen, :world_to_screen, [Vector3.by_value, Camera.by_value], Vector2.by_value, :last    # Returns the screen space position for a 3d world space position

    # Camera System Functions (Module: camera)
    ray_alias_object :SetCameraMode,              :mode=                # Set camera mode (multiple camera modes available)
    ray_alias_object :UpdateCamera,               :update               # Update camera position for selected mode

    ray_alias_static :SetCameraPanControl,        :pan_control=         # Set camera pan key to combine with mouse movement (free camera)
    ray_alias_static :SetCameraAltControl,        :alt_control=         # Set camera alt key to combine with mouse movement (free camera)
    ray_alias_static :SetCameraSmoothZoomControl, :smooth_zoom_control= # Set camera smooth zoom key to combine with mouse (free camera)
    ray_alias_static :SetCameraMoveControls,      :set_move_controls    # Set camera move controls (1st person and 3rd person cameras)

    # ensures begin_mode3d/end_mode3d using a block
    def mode3d
      begin_mode3d
      begin
        yield
      ensure
        end_mode3d
      end
    end
  end
end
