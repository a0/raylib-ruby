require_relative 'color'
require_relative 'texture2d'

module Raylib
  # Material texture map
  class MaterialMap
    layout  :texture, Texture2D.by_value,   # Material map texture
            :color,   Color.by_value,       # Material map color
            :value,   :float                # Material map value

    ray_struct_init_accessor :texture, :color, :value
  end
end
