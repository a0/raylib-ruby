module Raylib
  class Material
    # Material loading/unloading functions

    # Load materials from model file
    def self.load(filename)
      material_count = IntPtr.new
      result = RayLib.LoadMaterials filename, material_count
      result.read_array_of_pointer(material_count.value).map { |pointer| Material.new pointer }
    end
    ray_alias_static :LoadMaterialDefault,    :load_default         # Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    ray_alias_object :UnloadMaterial,         :unload               # Unload material from GPU memory (VRAM)
  end
end
