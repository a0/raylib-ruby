module Raylib
  class Font
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Font Loading and Text Drawing Functions (Module: text)
    #------------------------------------------------------------------------------------

    # Font loading/unloading functions
    ray_static :GetFontDefault,     :default,       [], Font.by_value                                             # Get the default Font
    ray_static :LoadFont,           :load,          %i[string], Font.by_value                                     # Load font from file into GPU memory (VRAM)
    ray_static :LoadFontEx,         :load_ex,       %i[string int int int], Font.by_value                         # Load font from file with extended parameters

    ray_static :LoadFontData,       :load_data,     [:string, :int, :int, :int, FontType], :pointer               # Load font data for further use
    ray_static :GenImageFontAtlas,  :image_atlas,   %i[pointer pointer int int int int], Image.by_value           # Generate image font atlas using chars info
    ray_object :UnloadFont,         :unload,        [Font.by_value], :void                                        # Unload Font from GPU memory (VRAM)

    # Text misc. functions
    ray_static :MeasureText,        :measure_text,  %i[string int], :int                                          # Measure string width for default font
    ray_object :MeasureTextEx,      :measure_text,  [Font.by_value, :string, :float, :float], Vector2.by_value    # Measure string size for Font
    ray_object :GetGlyphIndex,      :glyph_index,   [Font.by_value, :int], :int                                   # Get index position for a unicode character on font
  end
end
