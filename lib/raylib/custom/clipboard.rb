module Raylib
  class Clipboard
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    ray_static :GetClipboardText, :text,  [], :string         # Get clipboard text content
    ray_static :SetClipboardText, :text=, %i[string], :void   # Set clipboard text content
  end
end
