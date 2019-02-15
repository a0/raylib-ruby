module Raylib
  class RenderTexture2D
    # Drawing-related functions

    # Initializes render texture for drawing
    def begin_texture_mode
      Raylib.BeginTextureMode self
      return unless block_given?

      yield
      self.class.end_texture_mode
    end

    ray_alias_static :EndTextureMode, :end_texture_mode # Ends drawing to render texture

    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadRenderTexture,      :load             # Load texture for rendering (framebuffer)
    ray_alias_object :UnloadRenderTexture,    :unload           # Unload render texture from GPU memory (VRAM)
  end
end
