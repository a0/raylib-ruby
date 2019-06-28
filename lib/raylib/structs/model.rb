require_relative 'material'
require_relative 'matrix'
require_relative 'mesh'
require_relative 'transform'

module Raylib
  # Model type
  class Model
    layout  :transform, Matrix.by_value,    # Local transform matrix
            :mesh_count, :int,              # Number of meshes
            :meshes, :pointer,              # Meshes array
            :material_count, :int,          # Number of materials
            :materials, :pointer,           # Materials array
            :mesh_material, :pointer,       # Mesh material number
            :bone_count, :int,
            :bones, :pointer,
            :bind_pose, Transform.ptr

    ray_struct_accessor :transform
  end
end
