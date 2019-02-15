module Raylib
  class Camera2D
    # Initialize 2D mode with custom camera (2D)
    def begin_mode2d
      Raylib.BeginMode2D self
      return unless block_given?

      yield
      self.class.end_mode2d
    end

    ray_alias_static :EndMode2D, :end_mode2d # Ends 2D mode with custom camera
  end
end
