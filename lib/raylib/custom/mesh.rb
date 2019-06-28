module Raylib
  class Mesh
    # Model loading/unloading functions
    ray_alias_object :LoadModelFromMesh, :to_model # Load model from generated mesh

    # Mesh loading/unloading functions
    # TODO: LoadMeshes
    ray_alias_object :UnloadMesh,             :unload               # Unload mesh from memory (RAM and/or VRAM)
    ray_alias_object :ExportMesh,             :export               # Export mesh as an OBJ file

    # Mesh manipulation functions
    ray_alias_object :MeshBoundingBox,        :bounding_box         # Compute mesh bounding box limits
    ray_alias_object :MeshTangents,           :tangents             # Compute mesh tangents
    ray_alias_object :MeshBinormals,          :binormals            # Compute mesh binormals

    # Mesh generation functions
    ray_alias_static :GenMeshPlane,           :gen_plane            # Generate plane mesh (with subdivisions)
    ray_alias_static :GenMeshCube,            :gen_cube             # Generate cuboid mesh
    ray_alias_static :GenMeshSphere,          :gen_sphere           # Generate sphere mesh (standard sphere)
    ray_alias_static :GenMeshHemiSphere,      :gen_hemisphere       # Generate half-sphere mesh (no bottom cap)
    ray_alias_static :GenMeshCylinder,        :gen_cylinder         # Generate cylinder mesh
    ray_alias_static :GenMeshTorus,           :gen_torus            # Generate torus mesh
    ray_alias_static :GenMeshKnot,            :gen_knot             # Generate trefoil knot mesh
    ray_alias_static :GenMeshHeightmap,       :gen_heightmap        # Generate heightmap mesh from image data
    ray_alias_static :GenMeshCubicmap,        :gen_cubicmap         # Generate cubes-based map mesh from image data
  end
end
