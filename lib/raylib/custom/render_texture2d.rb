module Raylib
  class RenderTexture2D
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Drawing-related functions
    ray_object :BeginTextureMode, :begin_texture_mode,  [Camera2D.by_value], :void    # Initializes render texture for drawing
    ray_static :EndTextureMode,   :end_texture_mode,    [], :void                     # Ends drawing to render texture

    #------------------------------------------------------------------------------------
    # Texture Loading and Drawing Functions (Module: textures)
    #------------------------------------------------------------------------------------

    # Image/Texture2D data loading/unloading/saving functions
    ray_static :LoadRenderTexture,    :load,    %i[int int], RenderTexture2D.by_value   # Load texture for rendering (framebuffer)

    ray_object :UnloadRenderTexture,  :unload,  [RenderTexture2D.by_value], :void       # Unload render texture from GPU memory (VRAM)


    # ensures begin_texture_mode/end_texture_mode using a block
    def texture_mode
      begin_texture_mode
      begin
        yield
      ensure
        self.class.end_texture_mode
      end
    end
  end
end
