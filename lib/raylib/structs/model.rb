require_relative 'matrix'

module Raylib
  # Model type
  class Model
    layout  :transform, Matrix.by_value,    # Local transform matrix
            :mesh_count, :int,              # Number of meshes
            :meshes, :pointer,              # Meshes array
            :material_count, :int,          # Number of materials
            :materials, :pointer,           # Materials array
            :mesh_material, :pointer,       # Mesh material number
            # Animation data
            :bone_count, :int,              # Number of bones
            :bones, :pointer,               # Bones information (skeleton)
            :bind_pose, :pointer            # Bones base transformation (pose)

    ray_struct_accessor :transform, :mesh_count, :material_count, :bone_count
  end
end
