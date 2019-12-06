require_relative 'audio_stream'

module Raylib
  # Music stream type (audio file streaming from memory)
  # NOTE: Anything longer than ~10 seconds should be streamed
  class Music
    layout  :ctx_type,      :int,                   # Type of music context (audio filetype)
            :ctx_data,      :pointer,               # Audio context data, depends on type
            :sample_count,  :uint,                  # Total number of samples
            :loop_count,    :uint,                  # Loops count (times music will play), 0 means infinite loop
            :stream,        AudioStream.by_value    # Audio stream

    ray_struct_accessor :ctx_type, :ctx_data, :sample_count, :loop_count, :stream
  end
end
