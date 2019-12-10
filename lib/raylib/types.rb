module Raylib
  class AudioDevice; end
  class AudioStream < FFI::Struct; end
  class BoneInfo < FFI::Struct; end
  class BoundingBox < FFI::Struct; end
  class Camera2D < FFI::Struct; end
  class Camera3D < FFI::Struct; end
  Camera = Camera3D # Camera type fallback, defaults to Camera3D
  class CharInfo < FFI::Struct; end
  class Clipboard; end
  class Collision; end
  class Color < FFI::Struct; end
  class Cursor; end
  class Draw; end
  class Float16 < FFI::Struct; end
  class Float3 < FFI::Struct; end
  class FloatPtr < FFI::Struct; end
  class Font < FFI::Struct; end
  SpriteFont = Font # SpriteFont type fallback, defaults to Font
  class Gamepad; end
  class Image < FFI::Struct; end
  class IntPtr < FFI::Struct; end
  # FFI::Enum Key
  class Material < FFI::Struct; end
  class MaterialMap < FFI::Struct; end
  class Matrix < FFI::Struct; end
  class Mesh < FFI::Struct; end
  class Model < FFI::Struct; end
  class ModelAnimation < FFI::Struct; end
  class Monitor; end
  class Mouse; end
  class Music < FFI::Struct; end
  class NPatchInfo < FFI::Struct; end
  class Ray < FFI::Struct; end
  class RayHitInfo < FFI::Struct; end
  class Rectangle < FFI::Struct; end
  class RenderTexture2D < FFI::Struct; end
  RenderTexture = RenderTexture2D # RenderTexture type, same as RenderTexture2D
  class RlGL; end
  class Screen; end
  class Shader < FFI::Struct; end
  class Sound < FFI::Struct; end
  class Texture2D < FFI::Struct; end
  Texture = Texture2D # Texture type, same as Texture2D
  TextureCubemap = Texture2D # TextureCubemap type, actually, same as Texture2D
  class Touch; end
  class Transform < FFI::Struct; end
  class Vector2 < FFI::Struct; end
  class Vector3 < FFI::Struct; end
  class Vector4 < FFI::Struct; end
  Quaternion = Vector4 # Quaternion type, same as Vector4
  class VrDeviceInfo < FFI::Struct; end
  class VR; end
  class Wave < FFI::Struct; end
  class Window; end
end
