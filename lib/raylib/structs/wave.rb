module Raylib
  # Wave type, defines audio wave data
  class Wave
    layout  :sample_count,  :uint,      # Total number of samples
            :sample_rate,   :uint,      # Frequency (samples per second)
            :sample_size,   :uint,      # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
            :channels,      :uint,      # Number of channels (1-mono, 2-stereo)
            :data,          :pointer    # Buffer data pointer

    ray_struct_accessor :sample_count, :sample_rate, :sample_size, :channels, :data
  end
end
