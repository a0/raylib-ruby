require_relative 'audio_stream'

module Raylib
  # Sound source type
  class Sound
    layout  :sample_count,  :uint,                # Total number of samples
            :stream,        AudioStream.by_value  # Audio stream

    ray_struct_accessor :sample_count, :stream
  end
end
