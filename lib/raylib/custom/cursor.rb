module Raylib
  class Cursor
    # Cursor-related functions
    ray_alias_static :ShowCursor,     :show         # Shows cursor
    ray_alias_static :HideCursor,     :hide         # Hides cursor
    ray_alias_static :IsCursorHidden, :is_hidden?   # Check if cursor is not visible
    ray_alias_static :EnableCursor,   :enable       # Enables cursor (unlock cursor)
    ray_alias_static :DisableCursor,  :disable      # Disables cursor (lock cursor)
  end
end
