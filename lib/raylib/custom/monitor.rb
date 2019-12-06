module Raylib
  class Monitor
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Window and Graphics Device Functions (Module: core)
    #------------------------------------------------------------------------------------

    # Window-related functions
    ray_static :GetMonitorCount,          :count,           [], :int            # Get number of connected monitors
    ray_static :GetMonitorWidth,          :width,           %i[int], :int       # Get primary monitor width
    ray_static :GetMonitorHeight,         :height,          %i[int], :int       # Get primary monitor height
    ray_static :GetMonitorPhysicalWidth,  :physical_width,  %i[int], :int       # Get primary monitor physical width in millimetres
    ray_static :GetMonitorPhysicalHeight, :physycal_height, %i[int], :int       # Get primary monitor physical height in millimetres
    ray_static :GetMonitorName,           :name,            %i[int], :string    # Get the human-readable, UTF-8 encoded name of the primary monitor
  end
end
