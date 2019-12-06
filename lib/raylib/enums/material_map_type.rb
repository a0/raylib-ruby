module Raylib
  # Material map type
  MaterialMapType = enum(
    :albedo,      0,    # :diffuse
    :metalness,   1,    # :specular
    :normal,      2,
    :roughness,   3,
    :occlusion,
    :emission,
    :height,
    :cubemap,           # NOTE: Uses GL_TEXTURE_CUBE_MAP
    :irradiance,        # NOTE: Uses GL_TEXTURE_CUBE_MAP
    :prefilter,         # NOTE: Uses GL_TEXTURE_CUBE_MAP
    :brdf,
    :diffuse,     0,
    :specular,    1
  )
end
