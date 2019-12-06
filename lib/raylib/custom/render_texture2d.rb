module Raylib
  class RenderTexture2D
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Drawing-related functions
    ray_object :BeginTextureMode, :begin_texture_mode,  [Camera2D.by_value], :void    # Initializes render texture for drawing
    ray_object :EndTextureMode,   :end_texture_mode,    [], :void                     # Ends drawing to render texture

    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadRenderTexture,      :load             # Load texture for rendering (framebuffer)
    ray_alias_object :UnloadRenderTexture,    :unload           # Unload render texture from GPU memory (VRAM)

    # ensures begin_texture_mode/end_texture_mode using a block
    def texture_mode
      begin_texture_mode
      begin
        yield
      ensure
        end_texture_mode
      end
    end
  end
end
