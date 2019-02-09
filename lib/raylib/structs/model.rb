require_relative 'material'
require_relative 'matrix'
require_relative 'mesh'

module Raylib
  # Model type
  class Model
    layout  :mesh,      Mesh.by_value,      # Vertex data buffers (RAM and VRAM)
            :transform, Matrix.by_value,    # Local transform matrix
            :material,  Material.by_value   # Shader and textures data

    ray_struct_init_accessor :mesh, :transform, :material
  end
end
