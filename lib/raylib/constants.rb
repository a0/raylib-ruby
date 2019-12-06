module Raylib
  # Some basic Defines
  PI      = 3.14159265358979323846
  DEG2RAD = PI / 180.0
  RAD2DEG = 180.0 / PI

  class Camera3D
    TYPE_PERSPECTIVE   = 0
    TYPE_ORTHOGRAPHIC  = 1

    MODE_CUSTOM       = 0
    MODE_FREE         = 1
    MODE_ORBITAL      = 2
    MODE_FIRST_PERSON = 3
    MODE_THIRD_PERSON = 4
  end

  class Material
    MAX_MAPS = 12 # Maximum number of texture maps stored in shader struct
  end

  class Mesh
    MAX_VBO = 7 # Maximum number of vbo per mesh
  end

  class Shader
    MAX_LOCATIONS = 32 # Maximum number of predefined locations stored in shader struct
  end

  class RlGL
    LINES       = 0x0001
    TRIANGLES   = 0x0004
    QUADS       = 0x0007
  end
end
