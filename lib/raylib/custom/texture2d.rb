module Raylib
  class Texture2D
    # Image/Texture2D data loading/unloading/saving functions
    ray_alias_static :LoadTexture,            :load             # Load texture from file into GPU memory (VRAM)
    ray_alias_static :LoadTextureFromImage,   :load_from_image  # Load texture from image data
    ray_alias_object :UnloadTexture,          :unload           # Unload texture from GPU memory (VRAM)
    ray_alias_object :GetTextureData,         :to_image         # Get pixel data from GPU texture and return an Image
    ray_alias_object :UpdateTexture,          :update           # Update GPU texture with new data

    # Texture2D configuration functions
    ray_alias_object :GenTextureMipmaps,      :gen_mipmaps      # Generate GPU mipmaps for a texture
    ray_alias_object :SetTextureFilter,       :filter=          # Set texture scaling filter mode
    ray_alias_object :SetTextureWrap,         :wrap=            # Set texture wrapping mode

    # Texture2D drawing functions
    ray_alias_object :DrawTexture,            :draw             # Draw a Texture2D
    ray_alias_object :DrawTextureV,           :draw_v           # Draw a Texture2D with position defined as Vector2
    ray_alias_object :DrawTextureEx,          :draw_ex          # Draw a Texture2D with extended parameters
    ray_alias_object :DrawTextureRec,         :draw_rec         # Draw a part of a texture defined by a rectangle
    ray_alias_object :DrawTexturePro,         :draw_pro         # Draw a part of a texture defined by a rectangle with 'pro' parameters
  end
end
