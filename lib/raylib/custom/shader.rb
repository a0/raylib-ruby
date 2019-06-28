module Raylib
  class Shader
    # Shader loading/unloading functions
    ray_alias_static :LoadShader,             :load             # Load shader from files and bind default locations
    ray_alias_static :LoadShaderCode,         :load_code        # Load shader from code strings and bind default locations
    ray_alias_object :UnloadShader,           :unload           # Unload shader from GPU memory (VRAM)

    ray_alias_static :GetShaderDefault,       :default          # Get default shader

    # Shader configuration functions
    ray_alias_object :GetShaderLocation,      :location           # Get shader uniform location
    ray_alias_object :SetShaderValue,         :set_value          # Set shader uniform value
    ray_alias_object :SetShaderValueV,        :set_value_v        # Set shader uniform value vector
    ray_alias_object :SetShaderValueMatrix,   :set_value_matrix   # Set shader uniform value (matrix 4x4)
    ray_alias_object :SetShaderValueTexture,  :set_value_texture  # Set shader uniform value for texture
    ray_alias_static :SetMatrixProjection,    :matrix_projection= # Set a custom projection matrix (replaces internal projection matrix)
    ray_alias_static :SetMatrixModelview,     :matrix_modelview=  # Set a custom modelview matrix (replaces internal modelview matrix)
    ray_alias_static :GetMatrixModelview,     :matrix_modelview   # Get internal modelview matrix

    # Texture maps generation (PBR)
    # NOTE: Required shaders should be provided
    ray_alias_object :GenTextureCubemap,      :gen_texture_cubemap    # Generate cubemap texture from HDR texture
    ray_alias_object :GenTextureIrradiance,   :gen_texture_irradiance # Generate irradiance texture using cubemap data
    ray_alias_object :GenTexturePrefilter,    :gen_texture_prefilter  # Generate prefilter texture using cubemap data
    ray_alias_object :GenTextureBRDF,         :gen_texture_brdf       # Generate BRDF texture using cubemap data

    # Shading begin/end functions

    # Begin custom shader drawing
    def begin_shader_mode
      Raylib.BeginShaderMode self
      return unless block_given?

      yield
      self.class.end_shader_mode
    end

    ray_alias_static :EndShaderMode, :end_shader_mode # End custom shader drawing (use default shader)
  end
end
