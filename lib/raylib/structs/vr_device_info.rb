module Raylib
  # Head-Mounted-Display device parameters
  class VrDeviceInfo
    layout  :h_resolution,              :int,        # HMD horizontal resolution in pixels
            :v_resolution,              :int,        # HMD vertical resolution in pixels
            :h_screen_size,             :float,      # HMD horizontal size in meters
            :v_screen_size,             :float,      # HMD vertical size in meters
            :v_screen_center,           :float,      # HMD screen center in meters
            :eye_to_screen_distance,    :float,      # HMD distance between eye and display in meters
            :lens_separation_distance,  :float,      # HMD lens separation distance in meters
            :interpupillary_distance,   :float,      # HMD IPD (distance between pupils) in meters
            :lens_distortion_values,    [:float, 4], # HMD lens distortion constant parameters
            :chroma_ab_correction,      [:float, 4]  # HMD chromatic aberration correction parameters

    ray_struct_init_accessor  :h_resolution, :v_resolution,
                              :h_screen_size, :v_screen_size, :v_screen_center,
                              :eye_to_screen_distance, :lens_separation_distance, :interpupillary_distance, :lens_distortion_values,
                              :chroma_ab_correction
  end
end
