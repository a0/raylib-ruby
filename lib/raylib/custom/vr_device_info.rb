module Raylib
  class VrDeviceInfo
    # VR control functions
    ray_alias_static :GetVrDeviceInfo,        :device_info              # Get VR device information for some standard devices
    ray_alias_object :InitVrSimulator,        :init_vr_simulator        # Init VR simulator for selected device parameters
    ray_alias_static :CloseVrSimulator,       :close_vr_simulator       # Close VR simulator for current device
    ray_alias_static :IsVrSimulatorReady,     :is_vr_simulator_ready?   # Detect if VR simulator is ready
    ray_alias_static :SetVrDistortionShader,  :vr_distortion_shader=    # Set VR distortion shader for stereoscopic rendering
    ray_alias_static :UpdateVrTracking,       :vr_tracking=             # Update VR tracking (position and orientation) and camera
    ray_alias_static :ToggleVrMode,           :toggle_vr_mode           # Enable/Disable VR experience
    ray_alias_static :BeginVrDrawing,         :begin_vr_drawing         # Begin VR simulator stereo rendering
    ray_alias_static :EndVrDrawing,           :end_vr_drawing           # End VR simulator stereo rendering
  end
end
