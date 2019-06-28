module Raylib
  class Font
    # Font loading/unloading functions
    ray_alias_static :GetFontDefault,           :default              # Get the default Font
    ray_alias_static :LoadFont,                 :load                 # Load font from file into GPU memory (VRAM)
    ray_alias_static :LoadFontEx,               :load_ex              # Load font from file with extended parameters
    ray_alias_static :LoadFontData,             :load_data            # Load font data for further use
    ray_alias_static :GenImageFontAtlas,        :gen_image_atlas      # Generate image font atlas using chars info
    ray_alias_object :UnloadFont,               :unload               # Unload Font from GPU memory (VRAM)

    # Text misc. functions
    ray_alias_static :MeasureText,              :measure_text         # Measure string width for default font
    ray_alias_object :MeasureTextEx,            :measure_text         # Measure string size for Font
    ray_alias_object :GetGlyphIndex,            :glyph_index          # Get index position for a unicode character on font
  end
end
