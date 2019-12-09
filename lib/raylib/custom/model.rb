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
    ray_object :SetModelMeshMaterial, :set_mesh_material, [Model.ptr, :int, :int], :void    # Set material for a mesh

    # Model animations loading/unloading functions
    ray_object :UpdateModelAnimation,   :update_animation,  [Model.by_value, ModelAnimation.by_value, :int], :void    # Update model animation pose

    ray_static :IsModelAnimationValid,  :valid_animation?,  [Model.by_value, ModelAnimation.by_value], :bool          # Check model animation skeleton match

    # Model drawing functions
    ray_static :DrawModel,              :draw,              [Model.by_value]    
    ray_static :DrawModelEx,            :draw_ex,                 
    ray_static :DrawModelWires,         :draw_wires,                  
    ray_static :DrawModelWiresEx,       :draw_wires_ex,                 
    ray_static :DrawBoundingBox,        :draw_bounding_box,                  
    ray_static :DrawBillboard,          :draw_billboard,                  
    ray_static :DrawBillboardRec,       :draw_billboard_ex,                 

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
