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

    def materials
      puts "MATERIAL COUNT: #{self[:material_count]} got #{self[:materials].address}"
      result = self[:materials].read_array_of_pointer(self[:material_count]).map { |pointer| Material.new pointer }
      puts "RESULT: #{result}"
      puts "RESULT FIRST: #{result.first}"
      puts "RESULT FIRST SHADER: #{result.first.shader}"
      puts "RESULT FIRST SHADER: #{result.first.shader} #{result.first.shader[:id]}"
      result
    end
  end
end
