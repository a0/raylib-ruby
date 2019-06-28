module Raylib
  # Head-Mounted-Display device parameters
  class VrDeviceInfo
    layout  :hResolution,             :int,        # HMD horizontal resolution in pixels
            :vResolution,             :int,        # HMD vertical resolution in pixels
            :hScreenSize,             :float,      # HMD horizontal size in meters
            :vScreenSize,             :float,      # HMD vertical size in meters
            :vScreenCenter,           :float,      # HMD screen center in meters
            :eyeToScreenDistance,     :float,      # HMD distance between eye and display in meters
            :lensSeparationDistance,  :float,      # HMD lens separation distance in meters
            :interpupillaryDistance,  :float,      # HMD IPD (distance between pupils) in meters
            :lensDistortionValues,    [:float, 4], # HMD lens distortion constant parameters
            :chromaAbCorrection,      [:float, 4]  # HMD chromatic aberration correction parameters

    ray_struct_init_accessor  :hResolution, :vResolution, :hScreenSize, :vScreenSize, :vScreenCenter, :eyeToScreenDistance, :lensSeparationDistance,
                              :interpupillaryDistance, :lensDistortionValues, :chromaAbCorrection
  end
end
