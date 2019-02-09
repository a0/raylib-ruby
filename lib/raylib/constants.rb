module Raylib
  # Some basic Defines
  PI      = 3.14159265358979323846
  DEG2RAD = PI / 180.0
  RAD2DEG = 180.0 / PI

  # raylib Config Flags
  FLAG_SHOW_LOGO          =  1       # Set to show raylib logo at startup
  FLAG_FULLSCREEN_MODE    =  2       # Set to run program in fullscreen
  FLAG_WINDOW_RESIZABLE   =  4       # Set to allow resizable window
  FLAG_WINDOW_UNDECORATED =  8       # Set to disable window decoration (frame and buttons)
  FLAG_WINDOW_TRANSPARENT = 16       # Set to allow transparent window
  FLAG_MSAA_4X_HINT       = 32       # Set to try enabling MSAA 4X
  FLAG_VSYNC_HINT         = 64       # Set to try enabling V-Sync on GPU

  # Trace log type
  LOG_INFO      = 1
  LOG_WARNING   = 2
  LOG_ERROR     = 4
  LOG_DEBUG     = 8
  LOG_OTHER     = 16

  class Camera3D
    TYPE_PERSPECTIVE   = 0
    TYPE_ORTHOGRAPHIC  = 1

    MODE_CUSTOM       = 0
    MODE_FREE         = 1
    MODE_ORBITAL      = 2
    MODE_FIRST_PERSON = 3
    MODE_THIRD_PERSON = 4
  end

  class Draw
    BLEND_ALPHA = 0
    BLEND_ADDITIVE = 1
    BLEND_MULTIPLIED = 2
  end

  class Gamepad
    # Gamepad Number
    PLAYER1                 = 0
    PLAYER2                 = 1
    PLAYER3                 = 2
    PLAYER4                 = 3

    # Gamepad Buttons/Axis

    # PS3 USB Controller Buttons
    PS3_BUTTON_TRIANGLE     = 0
    PS3_BUTTON_CIRCLE       = 1
    PS3_BUTTON_CROSS        = 2
    PS3_BUTTON_SQUARE       = 3
    PS3_BUTTON_L1           = 6
    PS3_BUTTON_R1           = 7
    PS3_BUTTON_L2           = 4
    PS3_BUTTON_R2           = 5
    PS3_BUTTON_START        = 8
    PS3_BUTTON_SELECT       = 9
    PS3_BUTTON_UP           = 24
    PS3_BUTTON_RIGHT        = 25
    PS3_BUTTON_DOWN         = 26
    PS3_BUTTON_LEFT         = 27
    PS3_BUTTON_PS           = 12

    # PS3 USB Controller Axis
    PS3_AXIS_LEFT_X         = 0
    PS3_AXIS_LEFT_Y         = 1
    PS3_AXIS_RIGHT_X        = 2
    PS3_AXIS_RIGHT_Y        = 5
    PS3_AXIS_L2             = 3       # [1..-1] (pressure-level)
    PS3_AXIS_R2             = 4       # [1..-1] (pressure-level)

    # Xbox360 USB Controller Buttons
    XBOX_BUTTON_A           = 0
    XBOX_BUTTON_B           = 1
    XBOX_BUTTON_X           = 2
    XBOX_BUTTON_Y           = 3
    XBOX_BUTTON_LB          = 4
    XBOX_BUTTON_RB          = 5
    XBOX_BUTTON_SELECT      = 6
    XBOX_BUTTON_START       = 7
    XBOX_BUTTON_UP          = 10
    XBOX_BUTTON_RIGHT       = 11
    XBOX_BUTTON_DOWN        = 12
    XBOX_BUTTON_LEFT        = 13
    XBOX_BUTTON_HOME        = 8

    # Android Gamepad Controller (SNES CLASSIC)
    ANDROID_DPAD_UP         = 19
    ANDROID_DPAD_DOWN       = 20
    ANDROID_DPAD_LEFT       = 21
    ANDROID_DPAD_RIGHT      = 22
    ANDROID_DPAD_CENTER     = 23

    ANDROID_BUTTON_A        = 96
    ANDROID_BUTTON_B        = 97
    ANDROID_BUTTON_C        = 98
    ANDROID_BUTTON_X        = 99
    ANDROID_BUTTON_Y        = 100
    ANDROID_BUTTON_Z        = 101
    ANDROID_BUTTON_L1       = 102
    ANDROID_BUTTON_R1       = 103
    ANDROID_BUTTON_L2       = 104
    ANDROID_BUTTON_R2       = 105

    # Xbox360 USB Controller Axis
    # NOTE: For Raspberry Pi, axis must be reconfigured
    # FIXME: raylib-ruby detect raspberry pi?
    # if defined(PLATFORM_RPI)
    #     define GAMEPAD_XBOX_AXIS_LEFT_X    0   // [-1..1] (left->right)
    #     define GAMEPAD_XBOX_AXIS_LEFT_Y    1   // [-1..1] (up->down)
    #     define GAMEPAD_XBOX_AXIS_RIGHT_X   3   // [-1..1] (left->right)
    #     define GAMEPAD_XBOX_AXIS_RIGHT_Y   4   // [-1..1] (up->down)
    #     define GAMEPAD_XBOX_AXIS_LT        2   // [-1..1] (pressure-level)
    #     define GAMEPAD_XBOX_AXIS_RT        5   // [-1..1] (pressure-level)
    # else
    XBOX_AXIS_LEFT_X        = 0   # [-1..1] (left->right)
    XBOX_AXIS_LEFT_Y        = 1   # [1..-1] (up->down)
    XBOX_AXIS_RIGHT_X       = 2   # [-1..1] (left->right)
    XBOX_AXIS_RIGHT_Y       = 3   # [1..-1] (up->down)
    XBOX_AXIS_LT            = 4   # [-1..1] (pressure-level)
    XBOX_AXIS_RT            = 5   # [-1..1] (pressure-level)
    # endif
  end

  class Image
    # Pixel formats
    # NOTE: Support depends on OpenGL version and platform
    UNCOMPRESSED_GRAYSCALE    =  1    # 8 bit per pixel (no alpha)
    UNCOMPRESSED_GRAY_ALPHA   =  2    # 8*2 bpp (2 channels)
    UNCOMPRESSED_R5G6B5       =  3    # 16 bpp
    UNCOMPRESSED_R8G8B8       =  4    # 24 bpp
    UNCOMPRESSED_R5G5B5A1     =  5    # 16 bpp (1 bit alpha)
    UNCOMPRESSED_R4G4B4A4     =  6    # 16 bpp (4 bit alpha)
    UNCOMPRESSED_R8G8B8A8     =  7    # 32 bpp
    UNCOMPRESSED_R32          =  8    # 32 bpp (1 channel - float)
    UNCOMPRESSED_R32G32B32    =  9    # 32*3 bpp (3 channels - float)
    UNCOMPRESSED_R32G32B32A32 = 10    # 32*4 bpp (4 channels - float)
    COMPRESSED_DXT1_RGB       = 11    # 4 bpp (no alpha)
    COMPRESSED_DXT1_RGBA      = 12    # 4 bpp (1 bit alpha)
    COMPRESSED_DXT3_RGBA      = 13    # 8 bpp
    COMPRESSED_DXT5_RGBA      = 14    # 8 bpp
    COMPRESSED_ETC1_RGB       = 15    # 4 bpp
    COMPRESSED_ETC2_RGB       = 16    # 4 bpp
    COMPRESSED_ETC2_EAC_RGBA  = 17    # 8 bpp
    COMPRESSED_PVRT_RGB       = 18    # 4 bpp
    COMPRESSED_PVRT_RGBA      = 19    # 4 bpp
    COMPRESSED_ASTC_4X4_RGBA  = 20    # 8 bpp
    COMPRESSED_ASTC_8X8_RGBA  = 21    # 2 bpp
  end

  class Key
    # Keyboard Function Keys
    SPACE           =  32
    ESCAPE          = 256
    ENTER           = 257
    TAB             = 258
    BACKSPACE       = 259
    INSERT          = 260
    DELETE          = 261
    RIGHT           = 262
    LEFT            = 263
    DOWN            = 264
    UP              = 265
    PAGE_UP         = 266
    PAGE_DOWN       = 267
    HOME            = 268
    # END           = 269   END is a keyword, see last line
    CAPS_LOCK       = 280
    SCROLL_LOCK     = 281
    NUM_LOCK        = 282
    PRINT_SCREEN    = 283
    PAUSE           = 284
    F1              = 290
    F2              = 291
    F3              = 292
    F4              = 293
    F5              = 294
    F6              = 295
    F7              = 296
    F8              = 297
    F9              = 298
    F10             = 299
    F11             = 300
    F12             = 301
    LEFT_SHIFT      = 340
    LEFT_CONTROL    = 341
    LEFT_ALT        = 342
    RIGHT_SHIFT     = 344
    RIGHT_CONTROL   = 345
    RIGHT_ALT       = 346
    GRAVE           =  96
    SLASH           =  47
    BACKSLASH       =  92

    # Keyboard Alpha Numeric Keys
    ZERO            =  48
    ONE             =  49
    TWO             =  50
    THREE           =  51
    FOUR            =  52
    FIVE            =  53
    SIX             =  54
    SEVEN           =  55
    EIGHT           =  56
    NINE            =  57
    A               =  65
    B               =  66
    C               =  67
    D               =  68
    E               =  69
    F               =  70
    G               =  71
    H               =  72
    I               =  73
    J               =  74
    K               =  75
    L               =  76
    M               =  77
    N               =  78
    O               =  79
    P               =  80
    Q               =  81
    R               =  82
    S               =  83
    T               =  84
    U               =  85
    V               =  86
    W               =  87
    X               =  88
    Y               =  89
    Z               =  90

    # Android Physical Buttons
    BACK            =   4
    MENU            =  82
    VOLUME_UP       =  24
    VOLUME_DOWN     =  25
  end
  Key::END = 269 # END keyword

  class MaterialMap
    # Material map type
    ALBEDO      = 0   # DIFUSSE
    METALNESS   = 1   # SPECULAR
    NORMAL      = 2
    ROUGHNESS   = 3
    OCCLUSION   = 4
    EMISSION    = 5
    HEIGHT      = 6
    CUBEMAP     = 7   # NOTE: Uses GL_TEXTURE_CUBE_MAP
    IRRADIANCE  = 8   # NOTE: Uses GL_TEXTURE_CUBE_MAP
    PREFILTER   = 9   # NOTE: Uses GL_TEXTURE_CUBE_MAP
    BRDF        = 10

    DIFFUSE  = ALBEDO
    SPECULAR = METALNESS
  end

  class Material
    # Maximum number of texture maps stored in shader struct
    MAX_MAPS = 12

    # Material map type
    MAP_ALBEDO      =  0    # MAP_DIFFUSE
    MAP_METALNESS   =  1    # MAP_SPECULAR
    MAP_NORMAL      =  2
    MAP_ROUGHNESS   =  3
    MAP_OCCLUSION   =  4
    MAP_EMISSION    =  5
    MAP_HEIGHT      =  6
    MAP_CUBEMAP     =  7    # NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_IRRADIANCE  =  8    # NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_PREFILTER   =  9    # NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_BRDF        = 10

    MAP_DIFFUSE     = MAP_ALBEDO
    MAP_SPECULAR    = MAP_METALNESS
  end

  class Shader
    # Maximum number of predefined locations stored in shader struct
    MAX_LOCATIONS = 32

    # Shader location point type
    LOC_VERTEX_POSITION     =  0
    LOC_VERTEX_TEXCOORD01   =  1
    LOC_VERTEX_TEXCOORD02   =  2
    LOC_VERTEX_NORMAL       =  3
    LOC_VERTEX_TANGENT      =  4
    LOC_VERTEX_COLOR        =  5
    LOC_MATRIX_MVP          =  6
    LOC_MATRIX_MODEL        =  7
    LOC_MATRIX_VIEW         =  8
    LOC_MATRIX_PROJECTION   =  9
    LOC_VECTOR_VIEW         = 10
    LOC_COLOR_DIFFUSE       = 11
    LOC_COLOR_SPECULAR      = 12
    LOC_COLOR_AMBIENT       = 13
    LOC_MAP_ALBEDO          = 14    # LOC_MAP_DIFFUSE
    LOC_MAP_METALNESS       = 15    # LOC_MAP_SPECULAR
    LOC_MAP_NORMAL          = 16
    LOC_MAP_ROUGHNESS       = 17
    LOC_MAP_OCCLUSION       = 18
    LOC_MAP_EMISSION        = 19
    LOC_MAP_HEIGHT          = 20
    LOC_MAP_CUBEMAP         = 21
    LOC_MAP_IRRADIANCE      = 22
    LOC_MAP_PREFILTER       = 23
    LOC_MAP_BRDF            = 24

    LOC_MAP_DIFFUSE   = LOC_MAP_ALBEDO
    LOC_MAP_SPECULAR  = LOC_MAP_METALNESS
  end

  class Mouse
    # Mouse Buttons
    LEFT_BUTTON   = 0
    RIGHT_BUTTON  = 1
    MIDDLE_BUTTON = 2
  end

  class Texture2D
    # Texture parameters: filter mode
    # NOTE 1: Filtering considers mipmaps if available in the texture
    # NOTE 2: Filter is accordingly set for minification and magnification
    FILTER_POINT            = 0   # No filter, just pixel aproximation
    FILTER_BILINEAR         = 1   # Linear filtering
    FILTER_TRILINEAR        = 2   # Trilinear filtering (linear with mipmaps)
    FILTER_ANISOTROPIC_4X   = 3   # Anisotropic filtering 4x
    FILTER_ANISOTROPIC_8X   = 4   # Anisotropic filtering 8x
    FILTER_ANISOTROPIC_16X  = 5   # Anisotropic filtering 16x

    # Texture parameters: wrap mode
    WRAP_REPEAT = 0
    WRAP_CLAMP  = 1
    WRAP_MIRROR = 2
  end

  class VrDeviceInfo
    # Head Mounted Display devices
    HMD_DEFAULT_DEVICE  = 0
    HMD_OCULUS_RIFT_DK2 = 1
    HMD_OCULUS_RIFT_CV1 = 2
    HMD_OCULUS_GO       = 3
    HMD_VALVE_HTC_VIVE  = 4
    HMD_SONY_PSVR       = 5
  end
end
