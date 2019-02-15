module Raylib
  class Material
    # Material loading/unloading functions
    ray_alias_static :LoadMaterial,           :load                 # Load material from file
    ray_alias_static :LoadMaterialDefault,    :load_default         # Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    ray_alias_object :UnloadMaterial,         :unload               # Unload material from GPU memory (VRAM)
  end
end
