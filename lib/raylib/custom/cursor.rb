module Raylib
  class Cursor
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Cursor-related functions
    ray_static :ShowCursor,     :show,    [], :void   # Shows cursor
    ray_static :HideCursor,     :hide,    [], :void   # Hides cursor
    ray_static :IsCursorHidden, :hidden?, [], :bool   # Check if cursor is not visible
    ray_static :EnableCursor,   :enable,  [], :void   # Enables cursor (unlock cursor)
    ray_static :DisableCursor,  :disable, [], :void   # Disables cursor (lock cursor)
  end
end
