module Raylib
  #####################################################################################
  # rlgl.h
  #####################################################################################

  # Matrix operations
  attach_function :rlMatrixMode, %i[int], :void
  attach_function :rlPushMatrix, [], :void
  attach_function :rlPopMatrix, [], :void
  attach_function :rlLoadIdentity, [], :void
  attach_function :rlTranslatef, %i[float float float], :void
  attach_function :rlRotatef, %i[float float float float], :void
  attach_function :rlScalef, %i[float float float], :void
  attach_function :rlMultMatrixf, %i[pointer], :void
  attach_function :rlFrustum, %i[double double double double double double], :void
  attach_function :rlOrtho, %i[double double double double double double], :void
  attach_function :rlViewport, %i[int int int int], :void

  # Vertex level operation
  attach_function :rlBegin, %i[int], :void
  attach_function :rlEnd, [], :void
  attach_function :rlVertex2i, %i[int int], :void
  attach_function :rlVertex2f, %i[float float], :void
  attach_function :rlVertex2f, %i[float float], :void
  attach_function :rlVertex3f, %i[float float float], :void
  attach_function :rlTexCoord2f, %i[float float], :void
  attach_function :rlNormal3f, %i[float float float], :void
  attach_function :rlColor4ub, %i[uchar uchar uchar uchar], :void
  attach_function :rlColor3f, %i[float float float], :void
  attach_function :rlColor4f, %i[float float float float], :void

  # OpenGL equivalent functions (common to 1.1, 3.3+, ES2)
  attach_function :rlEnableTexture, %i[uint], :void
  attach_function :rlDisableTexture, [], :void
end
