module Raylib
  class Draw
    # Drawing-related functions
    ray_alias_static :ClearBackground,  :clear_background   # Set background color (framebuffer clear color)
    ray_alias_static :EndDrawing,       :end_drawing        # End canvas drawing and swap buffers (double buffering)

    # Setup canvas (framebuffer) to start drawing
    def self.begin_drawing
      Raylib.BeginDrawing
      return unless block_given?

      yield
      end_drawing
    end

    # Basic shapes drawing functions
    ray_alias_static :DrawPixel,                :pixel                  # Draw a pixel
    ray_alias_static :DrawPixelV,               :pixel_v                # Draw a pixel (Vector version)
    ray_alias_static :DrawLine,                 :line                   # Draw a line
    ray_alias_static :DrawLineV,                :line_v                 # Draw a line (Vector version)
    ray_alias_static :DrawLineEx,               :line_ex                # Draw a line defining thickness
    ray_alias_static :DrawLineBezier,           :line_bezier            # Draw a line using cubic-bezier curves in-out
    ray_alias_static :DrawCircle,               :circle                 # Draw a color-filled circle
    ray_alias_static :DrawCircleGradient,       :circle_gradient        # Draw a gradient-filled circle
    ray_alias_static :DrawCircleV,              :circle_v               # Draw a color-filled circle (Vector version)
    ray_alias_static :DrawCircleLines,          :circle_lines           # Draw circle outline
    ray_alias_static :DrawRectangle,            :rectangle              # Draw a color-filled rectangle
    ray_alias_static :DrawRectangleV,           :rectangle_v            # Draw a color-filled rectangle (Vector version)
    ray_alias_static :DrawRectangleGradientV,   :rectangle_gradient_v   # Draw a vertical-gradient-filled rectangle
    ray_alias_static :DrawRectangleGradientH,   :rectangle_gradient_h   # Draw a horizontal-gradient-filled rectangle
    ray_alias_static :DrawRectangleGradientEx,  :rectangle_gradient_ex  # Draw a gradient-filled rectangle with custom vertex colors
    ray_alias_static :DrawRectangleLines,       :rectangle_lines        # Draw rectangle outline
    ray_alias_static :DrawRectangleLinesEx,     :rectangle_lines_ex     # Draw rectangle outline with extended parameters
    ray_alias_static :DrawTriangle,             :triangle               # Draw a color-filled triangle
    ray_alias_static :DrawTriangleLines,        :triangle_lines         # Draw triangle outline
    ray_alias_static :DrawPoly,                 :poly                   # Draw a regular polygon (Vector version)
    ray_alias_static :DrawPolyEx,               :poly_ex                # Draw a closed polygon defined by points
    ray_alias_static :DrawPolyExLines,          :poly_ex_lines          # Draw polygon lines

    # Text drawing functions
    ray_alias_static :DrawFPS,                  :fps                    # Shows current FPS
    ray_alias_static :DrawText,                 :text                   # Draw text (using default font)
    ray_alias_static :DrawTextEx,               :text_ex                # Draw text using font and additional parameters

    # Basic geometric 3D shapes drawing functions
    ray_alias_static :DrawLine3D,               :line_3d                # Draw a line in 3D world space
    ray_alias_static :DrawCircle3D,             :circle_3d              # Draw a circle in 3D world space
    ray_alias_static :DrawCube,                 :cube                   # Draw cube
    ray_alias_static :DrawCubeV,                :cube_v                 # Draw cube (Vector version)
    ray_alias_static :DrawCubeWires,            :cube_wires             # Draw cube wires
    ray_alias_static :DrawCubeTexture,          :cube_texture           # Draw cube textured
    ray_alias_static :DrawSphere,               :sphere                 # Draw sphere
    ray_alias_static :DrawSphereEx,             :sphere_ex              # Draw sphere with extended parameters
    ray_alias_static :DrawSphereWires,          :sphere_wires           # Draw sphere wires
    ray_alias_static :DrawCylinder,             :cylinder               # Draw a cylinder/cone
    ray_alias_static :DrawCylinderWires,        :cylinder_wires         # Draw a cylinder/cone wires
    ray_alias_static :DrawPlane,                :plane                  # Draw a plane XZ
    ray_alias_static :DrawGrid,                 :grid                   # Draw a grid (centered at (0, 0, 0))
    ray_alias_static :DrawGizmo,                :gizmo                  # Draw simple gizmo

    # Model drawing functions
    ray_alias_static :DrawBillboard,            :billboard              # Draw a billboard texture
    ray_alias_static :DrawBillboardRec,         :billboard_rec          # Draw a billboard texture defined by sourceRec

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
