module Raylib
  class Texture2D
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Texture Loading and Drawing Functions (Module: textures)
    #------------------------------------------------------------------------------------

    # Image/Texture2D data loading/unloading/saving functions
    ray_static :LoadTexture,        :load,          %i[string], Texture2D.by_value                                                                                    # Load texture from file into GPU memory (VRAM)

    ray_object :UnloadTexture,      :unload,        [Texture2D.by_value], :void                                                                                       # Unload texture from GPU memory (VRAM)

    ray_object :GetTextureData,     :to_image,      [Texture2D.by_value], :void                                                                                       # Get pixel data from GPU texture and return an Image

    ray_object :UpdateTexture,      :update,        [Texture2D.by_value, :pointer], :void                                                                             # Update GPU texture with new data

    # Texture2D configuration functions
    ray_object :GenTextureMipmaps,  :mipmaps!,      [Texture2D.ptr], :void                                                                                            # Generate GPU mipmaps for a texture
    ray_object :SetTextureFilter,   :filter=,       [Texture2D.by_value, TextureFilterMode], :void                                                                    # Set texture scaling filter mode
    ray_object :SetTextureWrap,     :wrap=,         [Texture2D.by_value, TextureWrapMode], :void                                                                      # Set texture wrapping mode

    # Texture2D drawing functions
    ray_object :DrawTexture,        :draw,          [Texture2D.by_value, :int, :int, Color.by_value], :void                                                           # Draw a Texture2D
    ray_object :DrawTextureV,       :draw_v,        [Texture2D.by_value, Vector2.by_value, Color.by_value], :void                                                     # Draw a Texture2D with position defined as Vector2
    ray_object :DrawTextureEx,      :draw_ex,       [Texture2D.by_value, Vector2.by_value, :float, :float, Color.by_value], :void                                     # Draw a Texture2D with extended parameters
    ray_object :DrawTextureRec,     :draw_rec,      [Texture2D.by_value, Rectangle.by_value, Vector2.by_value, Color.by_value], :void                                 # Draw a part of a texture defined by a rectangle
    ray_object :DrawTextureQuad,    :draw_quad,     [Texture2D.by_value, Vector2.by_value, Vector2.by_value, Rectangle.by_value, Color.by_value], :void               # Draw texture quad with tiling and offset parameters
    ray_object :DrawTexturePro,     :draw_pro,      [Texture2D.by_value, Rectangle.by_value, Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void     # Draw a part of a texture defined by a rectangle with 'pro' parameters
    ray_object :DrawTextureNPatch,  :draw_n_patch,  [Texture2D.by_value, NPatchInfo.by_value, Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void    # Draws a texture (or part of it) that stretches or shrinks nicely
  end
end
