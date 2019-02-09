require_relative 'texture2d'

module Raylib
  # RenderTexture2D type, for texture rendering
  class RenderTexture2D
    layout  :id,      :uint,      # OpenGL Framebuffer Object (FBO) id
            :texture, Texture2D,  # Color buffer attachment texture
            :depth,   Texture2D   # Depth buffer attachment texture

    ray_struct_init_accessor :id, :texture, :depth
  end
end
