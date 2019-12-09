module Raylib
  class Mesh
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Model 3d Loading and Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Model loading/unloading functions
    ray_object :LoadModelFromMesh,  :to_model,  [Mesh.by_value], Model.by_value   # Load model from generated mesh (default material)

    # Mesh loading/unloading functions
    ray_static :LoadMeshes,         :load,      %i[string int], :pointer          # Load meshes from model file
    ray_object :ExportMesh,         :export,    [Mesh.by_value, :string], :void   # Export mesh data to file
    ray_object :UnloadMesh,         :unload,    [Mesh.by_value], :void            # Unload mesh from memory (RAM and/or VRAM)

    # Mesh generation functions
    ray_static :GenMeshPoly,        :gen_poly,        %i[int float], Mesh.by_value                        # Generate polygonal mesh
    ray_static :GenMeshPlane,       :gen_plane,       %i[float float int int], Mesh.by_value              # Generate plane mesh (with subdivisions)
    ray_static :GenMeshCube,        :gen_cube,        %i[float float float], Mesh.by_value                # Generate cuboid mesh
    ray_static :GenMeshSphere,      :gen_sphere,      %i[float int int], Mesh.by_value                    # Generate sphere mesh (standard sphere)
    ray_static :GenMeshHemiSphere,  :gen_hemisphere,  %i[float int int], Mesh.by_value                    # Generate half-sphere mesh (no bottom cap)
    ray_static :GenMeshCylinder,    :gen_cylinder,    %i[float float int], Mesh.by_value                  # Generate cylinder mesh
    ray_static :GenMeshTorus,       :gen_torus,       %i[float float int int], Mesh.by_value              # Generate torus mesh
    ray_static :GenMeshKnot,        :gen_knot,        %i[float float int int], Mesh.by_value              # Generate trefoil knot mesh
    ray_static :GenMeshHeightmap,   :gen_heightmap,   [Image.by_value, Vector3.by_value], Mesh.by_value   # Generate heightmap mesh from image data
    ray_static :GenMeshCubicmap,    :gen_cubicmap,    [Image.by_value, Vector3.by_value], Mesh.by_value   # Generate cubes-based map mesh from image data
    
    # Mesh manipulation functions
    ray_alias_object :MeshBoundingBox,        :bounding_box         # Compute mesh bounding box limits
    ray_alias_object :MeshTangents,           :tangents             # Compute mesh tangents
    ray_alias_object :MeshBinormals,          :binormals            # Compute mesh binormals
  end
end
