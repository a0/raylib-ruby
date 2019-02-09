module Raylib
  # Shader type (generic)
  class Shader
    layout  :id,      :uint,                  # Shader program id
            :locs,    [:int, MAX_LOCATIONS]   # Shader locations array

    ray_struct_init_accessor :id, :locs
  end
end
