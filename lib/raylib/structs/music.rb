require_relative 'audio_stream'

module Raylib
  # Music type (file streaming from memory)
  # NOTE: Anything longer than ~10 seconds should be streamed
  class Music
    layout  :ctx_type,      :int,                   # Type of music context (OGG, XM, MOD)
            :ctx_ogg,       :pointer,               # OGG audio context
            :ctx_mp3,       :pointer,               # MP3 audio context
            :ctx_xm,        :pointer,               # XM chiptune context
            :ctx_mod,       :pointer,               # MOD chiptune context
            :audio_stream,  AudioStream.by_value,   # Audio stream (double buffering)
            :loop_count,    :int,                   # Loops count (times music repeats), -1 means infinite loop
            :total_samples, :uint,                  # Total number of samples
            :samples_left,  :uint                   # Number of samples left to end

    ray_struct_accessor :ctx_type, :ctx_ogg, :ctx_mp3, :ctx_xm, :audio_stream, :loop_count, :total_samples, :samples_left

    TYPE_AUDIO_OGG   = 0
    TYPE_AUDIO_FLAC  = 1
    TYPE_AUDIO_MP3   = 2
    TYPE_MODULE_XM   = 3
    TYPE_MODULE_MOD  = 4
  end
end
