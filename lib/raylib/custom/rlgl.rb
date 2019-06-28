module Raylib
  class RlGL
    # Matrix operations
    ray_alias_static :rlMatrixMode,   :matrix_mode
    ray_alias_static :rlPopMatrix,    :pop_matrix
    ray_alias_static :rlLoadIdentity, :load_identity
    ray_alias_static :rlTranslatef,   :translatef
    ray_alias_static :rlRotatef,      :rotatef
    ray_alias_static :rlScalef,       :scalef
    ray_alias_static :rlMultMatrixf,  :mult_matrixf
    ray_alias_static :rlFrustum,      :frustum
    ray_alias_static :rlOrtho,        :ortho
    ray_alias_static :rlViewport,     :viewport

    def self.push_matrix
      Raylib.rlPushMatrix
      return unless block_given?

      yield
      pop_matrix
    end

    # Vertex level operations
    ray_alias_static :rlVertex2i,     :vertex2i
    ray_alias_static :rlVertex2f,     :vertex2f
    ray_alias_static :rlVertex3f,     :vertex3f
    ray_alias_static :rlTexCoord2f,   :tex_coord2f
    ray_alias_static :rlNormal3f,     :normal3f
    ray_alias_static :rlColor4ub,     :color4ub
    ray_alias_static :rlColor3f,      :color3f
    ray_alias_static :rlColor4f,      :color4f

    def self.begin(mode)
      Raylib.rlBegin mode
      return unless block_given?

      yield
      Raylib.rlEnd
    end
  end
end
