module Raylib
  class VR
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Shaders System Functions (Module: rlgl)
    # NOTE: This functions are useless when using OpenGL 1.1
    #------------------------------------------------------------------------------------

    # VR control functions
    ray_static :InitVrSimulator,     :init,           [], :void                                         # Init VR simulator for selected device parameters
    ray_static :CloseVrSimulator,    :close,          [], :void                                         # Close VR simulator for current device
    ray_static :UpdateVrTracking,    :tracking=,      [Camera.ptr], :void                               # Update VR tracking (position and orientation) and camera
    ray_static :SetVrConfiguration,  :config=,        [VrDeviceInfo.by_value, Shader.by_value], :void   # Set stereo rendering configuration parameters
    ray_static :IsVrSimulatorReady,  :ready?,         [], :bool                                         # Detect if VR simulator is ready
    ray_static :ToggleVrMode,        :toggle,         [], :void                                         # Enable/Disable VR experience
    ray_static :BeginVrDrawing,      :begin_drawing,  [], :void                                         # Begin VR simulator stereo rendering
    ray_static :EndVrDrawing,        :end_drawing,    [], :void                                         # End VR simulator stereo rendering
  end
end
