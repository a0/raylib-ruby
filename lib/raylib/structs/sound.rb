module Raylib
  # Wave type, defines audio wave data
  class Sound
    layout  :audio_buffer,  :pointer,   # Pointer to internal data used by the audio system
            :source,        :uint,      # Audio source id
            :buffer,        :uint,      # Audio buffer id
            :format,        :int        # Audio format specifier

    ray_struct_accessor :audio_buffer, :source, :buffer, :format
  end
end
