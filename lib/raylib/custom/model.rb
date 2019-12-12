require_relative 'material'

module Raylib
  class Model
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Model 3d Loading and Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Model loading/unloading functions
    ray_static :LoadModel,            :load,              %i[string], Model.by_value        # Load model from files (meshes and materials)

    ray_object :UnloadModel,          :unload,            [Model.by_value], :void           # Unload model from memory (RAM and/or VRAM)

    # Material loading/unloading functions
    ray_object :SetModelMeshMaterial, :set_mesh_material, [Model.ptr, :int, :int], :void # Set material for a mesh

    # Model animations loading/unloading functions
    ray_object :UpdateModelAnimation,   :update_animation,  [Model.by_value, ModelAnimation.by_value, :int], :void    # Update model animation pose

    ray_static :IsModelAnimationValid,  :valid_animation?,  [Model.by_value, ModelAnimation.by_value], :bool          # Check model animation skeleton match

    # Model drawing functions
    ray_object :DrawModel,              :draw,              [Model.by_value, Vector3.by_value, :float, Color.by_value], :void                                             # Draw a model (with texture if set)
    ray_object :DrawModelEx,            :draw_ex,           [Model.by_value, Vector3.by_value, Vector3.by_value, :float, Vector3.by_value, Color.by_value], :void         # Draw a model with extended parameters
    ray_object :DrawModelWires,         :draw_wires,        [Model.by_value, Vector3.by_value, :float, Color.by_value], :void                                             # Draw a model wires (with texture if set)
    ray_object :DrawModelWiresEx,       :draw_wires_ex,     [Model.by_value, Vector3.by_value, Vector3.by_value, :float, Vector3.by_value, Color.by_value], :void         # Draw a model wires (with texture if set) with extended parameters

    # TODO: There must be a better way of doing this…
    def meshes
      return @meshes if @meshes

      @meshes = mesh_count.times.map do |i|
        Mesh.new(self[:meshes] + i * Mesh.size)
      end
    end

    # TODO: There must be a better way of doing this…
    def materials
      puts "materials: #{@materials}" if @materials
      return @materials if @materials

      @materials = material_count.times.map do |i|
        Material.new(self[:materials] + i * Material.size)
      end
      puts "materials: #{@materials} material_count: #{material_count}"
      @materials
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
