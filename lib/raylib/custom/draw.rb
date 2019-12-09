module Raylib
  class Draw
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Drawing-related functions
    ray_static :ClearBackground,            :clear_background,        [Color.by_value], :void                                                                       # Set background color (framebuffer clear color)
    ray_static :BeginDrawing,               :begin_drawing,           [], :void                                                                                     # Setup canvas (framebuffer) to start drawing
    ray_static :EndDrawing,                 :end_drawing,             [], :void                                                                                     # End canvas drawing and swap buffers (double buffering)

    ray_static :BeginScissorMode,           :begin_scissor_mode,      %i[int int int int], :void                                                                    # Begin scissor mode (define screen area for following drawing)
    ray_static :EndScissorMode,             :end_scissor_mode,        [], :void                                                                                     # End scissor mode

    #------------------------------------------------------------------------------------
    # Basic Shapes Drawing Functions (Module: shapes)
    #------------------------------------------------------------------------------------

    # Basic shapes drawing functions
    ray_static :DrawPixel,                  :pixel,                   [:int, :int, Color.by_value], :void                                                           # Draw a pixel
    ray_static :DrawPixelV,                 :pixel_v,                 [Vector2.by_value, Color.by_value], :void                                                     # Draw a pixel (Vector version)
    ray_static :DrawLine,                   :line,                    [:int, :int, :int, :int, Color.by_value], :void                                               # Draw a line
    ray_static :DrawLineV,                  :line_v,                  [Vector2.by_value, Vector2.by_value, Color.by_value], :void                                   # Draw a line (Vector version)
    ray_static :DrawLineEx,                 :line_ex,                 [Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void                           # Draw a line defining thickness
    ray_static :DrawLineBezier,             :line_bezier,             [Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void                           # Draw a line using cubic-bezier curves in-out
    ray_static :DrawLineStrip,              :line_strip,              [Vector2.by_value, :int, Color.by_value], :void                                               # Draw lines sequence
    ray_static :DrawCircle,                 :circle,                  [:int, :int, :float, Color.by_value], :void                                                   # Draw a color-filled circle
    ray_static :DrawCircleSector,           :circle_sector,           [Vector2.by_value, :float, :int, :int, :int, Color.by_value], :void                           # Draw a piece of a circle
    ray_static :DrawCircleSectorLines,      :circle_sector_lines,     [Vector2.by_value, :float, :int, :int, :int, Color.by_value], :void                           # Draw circle sector outline
    ray_static :DrawCircleGradient,         :circle_gradient,         [:int, :int, :float, Color.by_value, Color.by_value], :void                                   # Draw a gradient-filled circle
    ray_static :DrawCircleV,                :circle_v,                [Vector2.by_value, :float, Color.by_value], :void                                             # Draw a color-filled circle (Vector version)
    ray_static :DrawCircleLines,            :circle_lines,            [:int, :int, :float, Color.by_value], :void                                                   # Draw circle outline
    ray_static :DrawRing,                   :ring,                    [Vector2.by_value, :float, :float, :int, :int, :int, Color.by_value], :void                   # Draw ring
    ray_static :DrawRingLines,              :ring_lines,              [Vector2.by_value, :float, :float, :int, :int, :int, Color.by_value], :void                   # Draw ring outline
    ray_static :DrawRectangle,              :rectangle,               [:int, :int, :int, :int, Color.by_value], :void                                               # Draw a color-filled rectangle
    ray_static :DrawRectangleV,             :rectangle_v,             [Vector2.by_value, Vector2.by_value, Color.by_value], :void                                   # Draw a color-filled rectangle (Vector version)
    ray_static :DrawRectangleRec,           :rectangle_rec,           [Rectangle.by_value, Color.by_value], :void                                                   # Draw a color-filled rectangle
    ray_static :DrawRectanglePro,           :rectangle_pro,           [Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void                         # Draw a color-filled rectangle with pro parameters
    ray_static :DrawRectangleGradientV,     :rectangle_gradient_v,    [:int, :int, :int, :int, Color.by_value, Color.by_value], :void                               # Draw a vertical-gradient-filled rectangle
    ray_static :DrawRectangleGradientH,     :rectangle_gradient_h,    [:int, :int, :int, :int, Color.by_value, Color.by_value], :void                               # Draw a horizontal-gradient-filled rectangle
    ray_static :DrawRectangleGradientEx,    :rectangle_gradient_ex,   [Rectangle.by_value, Color.by_value, Color.by_value, Color.by_value, Color.by_value], :void   # Draw a gradient-filled rectangle with custom vertex colors
    ray_static :DrawRectangleLines,         :rectangle_lines,         [:int, :int, :int, :int, Color.by_value], :void                                               # Draw rectangle outline
    ray_static :DrawRectangleLinesEx,       :rectangle_lines_ex,      [Rectangle.by_value, :int, Color.by_value], :void                                             # Draw rectangle outline with extended parameters
    ray_static :DrawRectangleRounded,       :rectangle_bounded,       [Rectangle.by_value, :float, :int, Color.by_value], :void                                     # Draw rectangle with rounded edges
    ray_static :DrawRectangleRoundedLines,  :rectangle_bounded_lines, [Rectangle.by_value, :float, :int, :int, Color.by_value], :void                               # Draw rectangle with rounded edges outline
    ray_static :DrawTriangle,               :triangle,                [Vector2.by_value, Vector2.by_value, Vector2.by_value, Color.by_value], :void                 # Draw a color-filled triangle (vertex in counter-clockwise order!)
    ray_static :DrawTriangleLines,          :triangle_lines,          [Vector2.by_value, Vector2.by_value, Vector2.by_value, Color.by_value], :void                 # Draw triangle outline (vertex in counter-clockwise order!)
    ray_static :DrawTriangleFan,            :triangle_fan,            [Vector2.by_value, :int, Color.by_value], :void                                               # Draw a triangle fan defined by points (first vertex is the center)
    ray_static :DrawTriangleStrip,          :triangle_strip,          [:pointer, :int, Color.by_value], :void                                                       # Draw a triangle strip defined by points
    ray_static :DrawPoly,                   :poly,                    [Vector2.by_value, :int, :float, :float, Color.by_value], :void                               # Draw a regular polygon (Vector version)

    ray_static :SetShapesTexture,           :set_shapes_texture,      [Texture2D.by_value, Rectangle.by_value], :void                                               # Define default texture used to draw shapes

    #------------------------------------------------------------------------------------
    # Font Loading and Text Drawing Functions (Module: text)
    #------------------------------------------------------------------------------------

    # Text drawing functions
    ray_static :DrawFPS,                    :fps,                     %i[int int], :void                                                                            # Shows current FPS
    ray_static :DrawText,                   :text,                    [:string, :int, :int, :int, Color.by_value], :void                                            # Draw text (using default font)
    ray_static :DrawTextEx,                 :text_ex,                 [Font.by_value, :string, Vector2.by_value, :float, :float, Color.by_value], :void             # Draw text using font and additional parameters
    ray_static :DrawTextRec,                :text_rec,                [Font.by_value, :string, Rectangle.by_value, :float, :float, :bool, Color.by_value], :void    # Draw text using font inside rectangle limits
    ray_static :DrawTextRecEx,              :text_rec_ex,             [Font.by_value, :string, Rectangle.by_value, :float, :float, :bool,
                                                                       Color.by_value, :int, :int, Color.by_value, Color.by_value], :void                           # Draw text using font inside rectangle limits with support for text selection
    ray_static :DrawTextCodepoint,          :text_codepoint,          [Font.by_value, :int, Vector2.by_value, :float, Color.by_value], :void                        # Draw one character (codepoint)

    #------------------------------------------------------------------------------------
    # Basic 3d Shapes Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Basic geometric 3D shapes drawing functions
    ray_static :DrawLine3D,                 :line_3d,                 [Vector3.by_value, Vector3.by_value, Color.by_value], :void                                   # Draw a line in 3D world space
    ray_static :DrawCircle3D,               :circle_3d,               [Vector3.by_value, :float, Vector3.by_value, :float, Color.by_value], :void                   # Draw a circle in 3D world space
    ray_static :DrawCube,                   :cube,                    [Vector3.by_value, :float, :float, :float, Color.by_value], :void                             # Draw cube
    ray_static :DrawCubeV,                  :cube_v,                  [Vector3.by_value, Vector3.by_value, Color.by_value], :void                                   # Draw cube (Vector version)
    ray_static :DrawCubeWires,              :cube_wires,              [Vector3.by_value, :float, :float, :float, Color.by_value], :void                             # Draw cube wires
    ray_static :DrawCubeWiresV,             :cube_wires_v,            [Vector3.by_value, Vector3.by_value, Color.by_value], :void                                   # Draw cube wires (Vector version)
    ray_static :DrawCubeTexture,            :cube_texture,            [Texture2D.by_value, Vector3.by_value, :float, :float, :float, Color.by_value], :void         # Draw cube textured
    ray_static :DrawSphere,                 :sphere,                  [Vector3.by_value, :float, Color.by_value], :void                                             # Draw sphere
    ray_static :DrawSphereEx,               :sphere_ex,               [Vector3.by_value, :float, :int, :int, Color.by_value], :void                                 # Draw sphere with extended parameters
    ray_static :DrawSphereWires,            :sphere_wires,            [Vector3.by_value, :float, :int, :int, Color.by_value], :void                                 # Draw sphere wires
    ray_static :DrawCylinder,               :cylinder,                [Vector3.by_value, :float, :float, :float, :int, Color.by_value], :void                       # Draw a cylinder/cone
    ray_static :DrawCylinderWires,          :cylinder_wires,          [Vector3.by_value, :float, :float, :float, :int, Color.by_value], :void                       # Draw a cylinder/cone wires
    ray_static :DrawPlane,                  :plane,                   [Vector3.by_value, Vector2.by_value, Color.by_value], :void                                   # Draw a plane XZ
    ray_static :DrawRay,                    :ray,                     [Ray.by_value, Color.by_value], :void                                                         # Draw a ray line
    ray_static :DrawGrid,                   :grid,                    %i[int float], :void                                                                          # Draw a grid (centered at (0, 0, 0))
    ray_static :DrawGizmo,                  :gizmo,                   [Vector3.by_value], :void                                                                     # Draw simple gizmo

    # Model drawing functions
    ray_alias_static :DrawBillboard,            :billboard              # Draw a billboard texture
    ray_alias_static :DrawBillboardRec,         :billboard_rec          # Draw a billboard texture defined by sourceRec

    # ensures begin_drawing/end_drawing using a block
    def self.drawing
      begin_drawing
      begin
        yield
      ensure
        end_drawing
      end
    end

    # ensures bing_scissor_mode/end_scissor_mode using a block
    def self.scissor_mode(x, y, width, height)
      begin_scissor_mode(x, y, width, height)
      begin
        yield
      ensure
        end_scissor_mode
      end
    end

    # Shading begin/end functions
    # Begin blending mode (alpha, additive, multiplied)
    def self.begin_blend_mode(mode)
      Raylib.BeginBlendMode mode
      return unless block_given?

      yield
      end_blend_mode
    end

    ray_alias_static :EndBlendMode, :end_blend_mode # End blending mode (reset to default: alpha blending)
  end
end
