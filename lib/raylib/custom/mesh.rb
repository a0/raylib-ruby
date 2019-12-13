module Raylib
  class Mesh
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Model 3d Loading and Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Model loading/unloading functions
    ray_object :LoadModelFromMesh,  :to_model,      [Mesh.by_value], Model.by_value # Load model from generated mesh (default material)

    # Mesh loading/unloading functions
    ray_static :LoadMeshes,         :load,          %i[string int], :pointer          # Load meshes from model file
    ray_object :ExportMesh,         :export,        [Mesh.by_value, :string], :void   # Export mesh data to file
    ray_object :UnloadMesh,         :unload,        [Mesh.ptr], :void                 # Unload mesh from memory (RAM and/or VRAM)

    # Mesh generation functions
    ray_static :GenMeshPoly,        :poly,          %i[int float], Mesh.by_value                        # Generate polygonal mesh
    ray_static :GenMeshPlane,       :plane,         %i[float float int int], Mesh.by_value              # Generate plane mesh (with subdivisions)
    ray_static :GenMeshCube,        :cube,          %i[float float float], Mesh.by_value                # Generate cuboid mesh
    ray_static :GenMeshSphere,      :sphere,        %i[float int int], Mesh.by_value                    # Generate sphere mesh (standard sphere)
    ray_static :GenMeshHemiSphere,  :hemisphere,    %i[float int int], Mesh.by_value                    # Generate half-sphere mesh (no bottom cap)
    ray_static :GenMeshCylinder,    :cylinder,      %i[float float int], Mesh.by_value                  # Generate cylinder mesh
    ray_static :GenMeshTorus,       :torus,         %i[float float int int], Mesh.by_value              # Generate torus mesh
    ray_static :GenMeshKnot,        :knot,          %i[float float int int], Mesh.by_value              # Generate trefoil knot mesh
    ray_static :GenMeshHeightmap,   :heightmap,     [Image.by_value, Vector3.by_value], Mesh.by_value   # Generate heightmap mesh from image data
    ray_static :GenMeshCubicmap,    :cubicmap,      [Image.by_value, Vector3.by_value], Mesh.by_value   # Generate cubes-based map mesh from image data

    # Mesh manipulation functions
    ray_object :MeshBoundingBox,    :bounding_box,  [Mesh.by_value], BoundingBox                        # Compute mesh bounding box limits
    ray_object :MeshTangents,       :tangents,      [Mesh.ptr], :void                                   # Compute mesh tangents
    ray_object :MeshBinormals,      :binormals,     [Mesh.ptr], :void                                   # Compute mesh binormals
  end
end
