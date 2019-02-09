module Raylib
  # Audio stream type
  # NOTE: Useful to create custom audio streams not bound to a specific file
  class AudioStream
    layout  :sample_rate,   :uint,      # Frequency (samples per second)
            :sample_size,   :uint,      # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
            :channels,      :uint,      # Number of channels (1-mono, 2-stereo)
            :audio_buffer,  :pointer,   # Pointer to internal data used by the audio system.
            :format,        :int,       # Audio format specifier
            :source,        :uint,      # Audio source id
            :buffers,       [:uint, 2]  # Audio buffers (double buffering)

    ray_struct_accessor :sample_rate, :sample_size, :channels, :audio_buffer, :format, :source, :buffers
  end
end
