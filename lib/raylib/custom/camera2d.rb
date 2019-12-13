module Raylib
  class Camera2D
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Drawing-related functions
    ray_object :BeginMode2D,  :begin_mode2d,  [Camera2D.by_value], :void    # Initialize 2D mode with custom camera (2D)
    ray_static :EndMode2D,    :end_mode2d,    [], :void                     # Ends 2D mode with custom camera

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
