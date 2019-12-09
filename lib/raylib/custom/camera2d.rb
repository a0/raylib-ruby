module Raylib
  class Camera2D
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Drawing-related functions
    ray_object :BeginMode2D,  :begin_mode2d,  [Camera2D.by_value], :void    # Initialize 2D mode with custom camera (2D)
    ray_static :EndMode2D,    :end_mode2d,    [], :void                     # Ends 2D mode with custom camera

    # Screen-space-related functions
    ray_object :GetCameraMatrix2D,  :matrix,          [Camera2D.by_value], Matrix.by_value                              # Returns camera 2d transform matrix
    ray_object :GetWorldToScreen2D, :world_to_screen, [Vector2.by_value, Camera2D.by_value], Vector2.by_value, :last    # Returns the screen space position for a 2d camera world space position
    ray_object :GetScreenToWorld2D, :screen_to_world, [Vector2.by_value, Camera2D.by_value], Vector2.by_value, :last    # Returns the world space position for a 2d camera screen space position

    # ensures begin_mode2d/end_mode2d using a block
    def mode2d
      begin_mode2d
      begin
        yield
      ensure
        self.class.end_mode2d
      end
    end
  end
end
