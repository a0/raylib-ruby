module Raylib
  class Color
    # Color-related functions
    ray_alias_object :ColorToInt,     :to_i           # Returns hexadecimal value for a Color
    ray_alias_object :ColorNormalize, :to_normalized  # Returns color normalized as float [0..1]
    ray_alias_object :ColorToHSV,     :to_hsv         # Returns HSV values for a Color
    ray_alias_static :GetColor,       :from_i         # Returns a Color struct from hexadecimal value
    ray_alias_object :Fade,           :fade           # Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

    # Some Basic Colors
    # NOTE: Custom raylib color palette for amazing visuals on WHITE background
    LIGHTGRAY   = Color.new 200, 200, 200, 255    # Light Gray
    GRAY        = Color.new 130, 130, 130, 255    # Gray
    DARKGRAY    = Color.new  80,  80,  80, 255    # Dark Gray
    YELLOW      = Color.new 253, 249,   0, 255    # Yellow
    GOLD        = Color.new 255, 203,   0, 255    # Gold
    ORANGE      = Color.new 255, 161,   0, 255    # Orange
    PINK        = Color.new 255, 109, 194, 255    # Pink
    RED         = Color.new 230,  41,  55, 255    # Red
    MAROON      = Color.new 190,  33,  55, 255    # Maroon
    GREEN       = Color.new   0, 228,  48, 255    # Green
    LIME        = Color.new   0, 158,  47, 255    # Lime
    DARKGREEN   = Color.new   0, 117,  44, 255    # Dark Green
    SKYBLUE     = Color.new 102, 191, 255, 255    # Sky Blue
    BLUE        = Color.new   0, 121, 241, 255    # Blue
    DARKBLUE    = Color.new   0,  82, 172, 255    # Dark Blue
    PURPLE      = Color.new 200, 122, 255, 255    # Purple
    VIOLET      = Color.new 135,  60, 190, 255    # Violet
    DARKPURPLE  = Color.new 112,  31, 126, 255    # Dark Purple
    BEIGE       = Color.new 211, 176, 131, 255    # Beige
    BROWN       = Color.new 127, 106,  79, 255    # Brown
    DARKBROWN   = Color.new  76,  63,  47, 255    # Dark Brown

    WHITE       = Color.new 255, 255, 255, 255    # White
    BLACK       = Color.new   0,   0,   0, 255    # Black
    BLANK       = Color.new   0,   0,   0,   0    # Blank (Transparent)
    MAGENTA     = Color.new 255,   0, 255, 255    # Magenta
    RAYWHITE    = Color.new 245, 245, 245, 255    # My own White (raylib logo)
  end
end
