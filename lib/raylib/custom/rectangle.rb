module Raylib
  class Rectangle
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Basic Shapes Drawing Functions (Module: shapes)
    #------------------------------------------------------------------------------------

    # Basic shapes drawing functions
    ray_object :DrawRectangleRec,           :draw,                [Rectangle.by_value, Color.by_value], :void                                                   # Draw a color-filled rectangle
    ray_object :DrawRectanglePro,           :draw_pro,            [Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void                         # Draw a color-filled rectangle with pro parameters

    ray_object :DrawRectangleGradientEx,    :draw_gradient_ex,    [Rectangle.by_value, Color.by_value, Color.by_value, Color.by_value, Color.by_value], :void   # Draw a gradient-filled rectangle with custom vertex colors

    ray_object :DrawRectangleLinesEx,       :draw_lines_ex,       [Rectangle.by_value, :int, Color.by_value], :void                                             # Draw rectangle outline with extended parameters
    ray_object :DrawRectangleRounded,       :draw_bounded,        [Rectangle.by_value, :float, :int, Color.by_value], :void                                     # Draw rectangle with rounded edges
    ray_object :DrawRectangleRoundedLines,  :draw_bounded_lines,  [Rectangle.by_value, :float, :int, :int, Color.by_value], :void                               # Draw rectangle with rounded edges outline
  end
end
