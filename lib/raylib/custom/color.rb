module Raylib
  class Color
    extend FFIAttach
    extend Mapping

    # Some Basic Colors
    # NOTE: Custom raylib color palette for amazing visuals on WHITE background
    # rubocop:disable Layout/ExtraSpacing
    ray_map :lightgray,     200, 200, 200, 255    # Light Gray
    ray_map :gray,          130, 130, 130, 255    # Gray
    ray_map :darkgray,       80,  80,  80, 255    # Dark Gray
    ray_map :yellow,        253, 249,   0, 255    # Yellow
    ray_map :gold,          255, 203,   0, 255    # Gold
    ray_map :orange,        255, 161,   0, 255    # Orange
    ray_map :pink,          255, 109, 194, 255    # Pink
    ray_map :red,           230,  41,  55, 255    # Red
    ray_map :maroon,        190,  33,  55, 255    # Maroon
    ray_map :green,           0, 228,  48, 255    # Green
    ray_map :lime,            0, 158,  47, 255    # Lime
    ray_map :darkgreen,       0, 117,  44, 255    # Dark Green
    ray_map :skyblue,       102, 191, 255, 255    # Sky Blue
    ray_map :blue,            0, 121, 241, 255    # Blue
    ray_map :darkblue,        0,  82, 172, 255    # Dark Blue
    ray_map :purple,        200, 122, 255, 255    # Purple
    ray_map :violet,        135,  60, 190, 255    # Violet
    ray_map :darkpurple,    112,  31, 126, 255    # Dark Purple
    ray_map :beige,         211, 176, 131, 255    # Beige
    ray_map :brown,         127, 106,  79, 255    # Brown
    ray_map :darkbrown,      76,  63,  47, 255    # Dark Brown

    ray_map :white,         255, 255, 255, 255    # White
    ray_map :black,           0,   0,   0, 255    # Black
    ray_map :blank,           0,   0,   0,   0    # Blank (Transparent)
    ray_map :magenta,       255,   0, 255, 255    # Magenta
    ray_map :raywhite,      245, 245, 245, 255    # My own White (raylib logo)
    # rubocop:enable Layout/ExtraSpacing

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Color-related functions
    ray_object :ColorToInt,          :to_i,            [Color.by_value], :int                     # Returns hexadecimal value for a Color
    ray_object :ColorNormalize,      :to_normalize,    [Color.by_value], Vector4.by_value         # Returns color normalized as float [0..1]
    ray_static :ColorFromNormalized, :from_normalize,  [Vector4.by_value], Color.by_value         # Returns color from normalized values [0..1]
    ray_object :ColorToHSV,          :to_hsv,          [Color.by_value], Vector3.by_value         # Returns HSV values for a Color
    ray_static :ColorFromHSV,        :from_hsv,        [Vector3.by_value], Color.by_value         # Returns a Color from HSV values
    ray_object :GetColor,            :from_i,          %i[int], Color.by_value                    # Returns a Color struct from hexadecimal value
    ray_object :Fade,                :fade,            [Color.by_value, :float], Color.by_value   # Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

    # Simpler RayColor.fade :raywhite, 0.5
    def self.fade(color, alpha)
      Raylib.send(:Fade, RayColor[color] || color, alpha)
    end
  end
end
