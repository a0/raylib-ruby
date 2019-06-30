module Raylib
  class AudioDevice; end
  class AudioStream < FFI::Struct; end
  class BoneInfo < FFI::Struct; end
  class BoundingBox < FFI::Struct; end
  class Camera2D < FFI::Struct; end
  class Camera3D < FFI::Struct; end
  Camera = Camera3D # Camera type fallback, defaults to Camera3D
  class CharInfo < FFI::Struct; end
  class Collision; end
  class Color < FFI::Struct; end
  class Cursor; end
  class Draw; end
  class Font < FFI::Struct; end
  SpriteFont = Font # SpriteFont type fallback, defaults to Font
  class Gamepad; end
  class Image < FFI::Struct; end
  class Key; end
  class Material < FFI::Struct; end
  class MaterialMap < FFI::Struct; end
  class Matrix < FFI::Struct; end
  class Mesh < FFI::Struct; end
  class Model < FFI::Struct; end
  class ModelAnimation < FFI::Struct; end
  class Mouse; end
  class Music < FFI::Struct; end
  class NPatchInfo < FFI::Struct; end
  class Ray < FFI::Struct; end
  class RayHitInfo < FFI::Struct; end
  class Rectangle < FFI::Struct; end
  class RenderTexture2D < FFI::Struct; end
  RenderTexture = RenderTexture2D # RenderTexture type, same as RenderTexture2D
  class RlGL; end
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
  class Wave < FFI::Struct; end
  class Window; end
end

RayAudioDevice = Raylib::AudioDevice
RayAudioStream = Raylib::AudioStream
RayBoundingBox = Raylib::BoundingBox
RayCamera = Raylib::Camera
RayCamera2D = Raylib::Camera2D
RayCamera3D = Raylib::Camera3D
RayCharInfo = Raylib::CharInfo
RayCollision = Raylib::Collision
RayColor = Raylib::Color
RayCursor = Raylib::Cursor
RayDraw = Raylib::Draw
RayFont = Raylib::Font
RayGamepad = Raylib::Gamepad
RayImage = Raylib::Image
RayKey = Raylib::Key
RayMaterial = Raylib::Material
RayMaterialMap = Raylib::MaterialMap
RayMatrix = Raylib::Matrix
RayMesh = Raylib::Mesh
RayModel = Raylib::Model
RayModelAnimation = Raylib::ModelAnimation
RayMouse = Raylib::Mouse
RayMusic = Raylib::Music
RayRay = Raylib::Ray
RayRayHitInfo = Raylib::RayHitInfo
RayRectangle = Raylib::Rectangle
RayRenderTexture = Raylib::RenderTexture
RayRenderTexture2D = Raylib::RenderTexture2D
RayGL = Raylib::RlGL
RayShader = Raylib::Shader
RaySound = Raylib::Sound
RaySpriteFont = Raylib::SpriteFont
RayTexture = Raylib::Texture
RayTexture2D = Raylib::Texture2D
RayTextureCubemap = Raylib::TextureCubemap
RayVector2 = Raylib::Vector2
RayVector3 = Raylib::Vector3
RayVector4 = Raylib::Vector4
RayQuaternion = Raylib::Quaternion
RayVrDeviceInfo = Raylib::VrDeviceInfo
RayWave = Raylib::Wave
RayWindow = Raylib::Window
