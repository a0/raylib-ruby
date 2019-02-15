module Raylib
  class Camera3D
    # Initializes 3D mode with custom camera (3D)
    def begin_mode3d
      Raylib.BeginMode3D self
      return unless block_given?

      yield
      self.class.end_mode3d
    end

    ray_alias_static :EndMode3D, :end_mode3d # Ends 3D mode and returns to default 2D orthographic mode

    # Screen-space-related functions

    # Returns a ray trace from mouse position
    def ray(mouse_position)
      Raylib.GetMouseRay mouse_position, self
    end

    # Returns the screen space position for a 3d world space position
    def world_to_screen(cube)
      Raylib.GetWorldToScreen cube, self
    end

    ray_alias_object :GetCameraMatrix, :matrix # Returns camera transform matrix (view matrix)

    # Camera System Functions (Module: camera)
    ray_alias_object :SetCameraMode,              :mode=                # Set camera mode (multiple camera modes available)
    ray_alias_object :UpdateCamera,               :update               # Update camera position for selected mode

    ray_alias_static :SetCameraPanControl,        :pan_control=         # Set camera pan key to combine with mouse movement (free camera)
    ray_alias_static :SetCameraAltControl,        :alt_control=         # Set camera alt key to combine with mouse movement (free camera)
    ray_alias_static :SetCameraSmoothZoomControl, :smooth_zoom_control= # Set camera smooth zoom key to combine with mouse (free camera)
    ray_alias_static :SetCameraMoveControls,      :set_move_controls    # Set camera move controls (1st person and 3rd person cameras)
  end
end
