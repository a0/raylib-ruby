require_relative 'material'

module Raylib
  class Model
    # Model loading/unloading functions
    ray_alias_static :LoadModel,              :load                 # Load model from files (mesh and material)
    ray_alias_object :UnloadModel,            :unload               # Unload model from memory (RAM and/or VRAM)

    # Model drawing functions
    ray_alias_object :DrawModel,              :draw                 # Draw a model (with texture if set)
    ray_alias_object :DrawModelEx,            :draw_ex              # Draw a model with extended parameters
    ray_alias_object :DrawModelWires,         :draw_wires           # Draw a model wires (with texture if set)
    ray_alias_object :DrawModelWiresEx,       :draw_wires_ex        # Draw a model wires (with texture if set) with extended parameters

    # TODO: There must be a better way of doing this…
    def meshes
      return @meshes if @meshes

      @meshes = mesh_count.times.map do |i|
        Mesh.new(self[:meshes] + i * Mesh.size)
      end
    end

    # TODO: There must be a better way of doing this…
    def materials
      return @materials if @materials

      @materials = material_count.times.map do |i|
        Material.new(self[:materials] + i * Material.size)
      end
    end

    # TODO: There must be a better way of doing this…
    def bones
      return @bones if @bones

      @bones = bone_count.times.map do |i|
        BoneInfo.new(self[:bones] + i * BoneInfo.size)
      end
    end
  end
end
