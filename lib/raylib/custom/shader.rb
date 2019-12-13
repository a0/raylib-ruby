module Raylib
  class Shader
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Shaders System Functions (Module: rlgl)
    # NOTE: This functions are useless when using OpenGL 1.1
    #------------------------------------------------------------------------------------

    # Shader loading/unloading functions
    ray_static :LoadShader,       :load,          %i[string string], Shader.by_value    # Load shader from files and bind default locations
    ray_static :LoadShaderCode,   :load_code,     %i[string string], Shader.by_value    # Load shader from code strings and bind default locations
    ray_object :UnloadShader,     :unload,        [Shader.by_value], :void              # Unload shader from GPU memory (VRAM)

    ray_static :GetShaderDefault, :default,       [], Shader.by_value                   # Get default shader

    # Shader configuration functions
    ray_object :GetShaderLocation,      :location,            [Shader.by_value, :string], :int                                        # Get shader uniform location
    ray_object :SetShaderValue,         :set_value,           [Shader.by_value, :int, :pointer, ShaderUniformDataType], :void         # Set shader uniform value
    ray_object :SetShaderValueV,        :set_value_v,         [Shader.by_value, :int, :pointer, ShaderUniformDataType, :int], :void   # Set shader uniform value vector
    ray_object :SetShaderValueMatrix,   :set_value_matrix,    [Shader.by_value, :int, Matrix.by_value], :void                         # Set shader uniform value (matrix 4x4)
    ray_object :SetShaderValueTexture,  :set_value_texture,   [Shader.by_value, :int, Texture2D.by_value], :void                      # Set shader uniform value for texture
    ray_object :SetMatrixProjection,    :matrix_projection=,  [Matrix.by_value], :void                                                # Set a custom projection matrix (replaces internal projection matrix)
    ray_static :SetMatrixModelview,     :matrix_modelview=,   [Matrix.by_value], :void                                                # Set a custom modelview matrix (replaces internal modelview matrix)
    ray_static :GetMatrixModelview,     :matrix_modelview,    [], Matrix.by_value                                                     # Get internal modelview matrix

    # Texture maps generation (PBR)
    # NOTE: Required shaders should be provided
    ray_object :GenTextureCubemap,      :texture_cubemap,     [Shader.by_value, Texture2D.by_value, :int], Texture2D.by_value         # Generate cubemap texture from HDR texture
    ray_object :GenTextureIrradiance,   :texture_irradiance,  [Shader.by_value, Texture2D.by_value, :int], Texture2D.by_value         # Generate irradiance texture using cubemap data
    ray_object :GenTexturePrefilter,    :texture_prefilter,   [Shader.by_value, Texture2D.by_value, :int], Texture2D.by_value         # Generate prefilter texture using cubemap data
    ray_object :GenTextureBRDF,         :texture_brdf,        [Shader.by_value, :int], Texture2D.by_value                             # Generate BRDF texture

    # Shading begin/end functions
    ray_object :BeginShaderMode,        :begin_shader_mode,   [Shader.by_value], :void                                                # Begin custom shader drawing
    ray_static :EndShaderMode,          :end_shader_mode,     [], :void                                                               # End custom shader drawing (use default shader)

    # ensures begin_shader_mode/end_shader_mode using a block
    def shader_mode
      begin_shader_mode
      begin
        yield
      ensure
        self.class.end_shader_mode
      end
    end
  end
end
