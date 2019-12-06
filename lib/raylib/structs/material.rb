require_relative 'material_map'
require_relative 'shader'

module Raylib
  # Material type (generic)
  class Material
    layout  :shader,  Shader.by_value,                    # Material shader
            :maps,    [MaterialMap.by_value, MAX_MAPS],   # Material maps array (MAX_MATERIAL_MAPS)
            :params,  :pointer                            # Material generic parameters (if required)

    ray_struct_accessor :shader, :maps, :params
  end
end
