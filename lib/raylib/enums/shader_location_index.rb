module Raylib
  # Shader location point type
  SharedLocationIndex = enum(
    :vertex_position,
    :vertex_texcoord01,
    :vertex_texcoord02,
    :vertex_normal,
    :vertex_tangent,
    :vertex_color,
    :matrix_mvp,
    :matrix_model,
    :matrix_view,
    :matrix_projection,
    :vector_view,
    :color_diffuse,
    :color_specular,
    :color_ambient,
    :map_albedo,                # loc_map_diffuse
    :map_metalness,             # loc_map_specular
    :map_normal,
    :map_roughness,
    :map_occlusion,
    :map_emission,
    :map_height,
    :map_cubemap,
    :map_irradiance,
    :map_prefilter,
    :map_brdf,
    :map_diffuse,           14,
    :map_specular,          15
  )
end
