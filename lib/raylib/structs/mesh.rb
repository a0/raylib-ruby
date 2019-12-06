module Raylib
  # Vertex data definning a mesh
  # NOTE: Data stored in CPU memory (and GPU)
  class Mesh
    layout  :vertex_count,    :int,             # Number of vertices stored in arrays
            :triangle_count,  :int,             # Number of triangles stored (indexed or not)
            # Default vertex data
            :vertices,        :pointer,         # Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
            :texcoords,       :pointer,         # Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
            :texcoords2,      :pointer,         # Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
            :normals,         :pointer,         # Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
            :tangents,        :pointer,         # Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
            :colors,          :pointer,         # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
            :indices,         :pointer,         # Vertex indices (in case vertex data comes indexed)
            # Animation vertex data
            :anim_vertices,   :pointer,         # Animated vertex positions (after bones transformations)
            :anim_normals,    :pointer,         # Animated normals (after bones transformations)
            :bone_ids,        :pointer,         # Vertex bone ids, up to 4 bones influence by vertex (skinning)
            :bone_weights,    :pointer,         # Vertex bone weight, up to 4 bones influence by vertex (skinning)
            # OpenGL identifiers
            :vao_id,          :uint,            # OpenGL Vertex Array Object id
            :vbo_id,          [:uint, MAX_VBO]  # OpenGL Vertex Buffer Objects id (default vertex data)

    ray_struct_accessor :vertex_count, :triangle_count,
                        :vertices, :texcoords, :texcoords2, :normals, :tangents, :colors, :indices,
                        :anim_vertices, :anim_normals, :bone_ids, :bone_weights,
                        :vao_id, :vbo_id
  end
end
