module Raylib
  class Material
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Model 3d Loading and Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Material loading/unloading functions
    ray_static :LoadMaterials, :load, %i[string pointer], :pointer do |_function, name, _mapping| # Load materials from model file
      singleton_class.define_method name do |filename|
        material_count = IntPtr.new
        result = Raylib.LoadMaterials filename, material_count
        result.read_array_of_pointer(material_count.value).map { |pointer| Material.new pointer }
      end
    end
    ray_static :LoadMaterialDefault,  :load_default,      [], Material.by_value                                         # Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    ray_object :UnloadMaterial,       :unload,            [Material.by_value], :void                                    # Unload material from GPU memory (VRAM)
    ray_object :SetMaterialTexture,   :set_texture,       [Material.ptr, MaterialMapType, Texture2D.by_value], :void    # Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
  end
end
