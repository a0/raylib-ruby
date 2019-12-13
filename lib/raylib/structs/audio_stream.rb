module Raylib
  # Audio stream type
  # NOTE: Useful to create custom audio streams not bound to a specific file
  class AudioStream < FFI::Struct
    layout  :sample_rate,   :uint,      # Frequency (samples per second)
            :sample_size,   :uint,      # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
            :channels,      :uint,      # Number of channels (1-mono, 2-stereo)
            :audio_buffer, :pointer     # Pointer to internal data used by the audio system.

    ray_struct_accessor :sample_rate, :sample_size, :channels, :audio_buffer
  end
end
