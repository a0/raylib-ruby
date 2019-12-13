module Raylib
  class AudioStream
    # AudioStream management functions
    ray_alias_static :InitAudioStream,          :create                   # Init audio stream (to stream raw audio pcm data)
    ray_alias_object :UpdateAudioStream,        :update                   # Update audio stream buffers with data
    ray_alias_object :CloseAudioStream,         :close                    # Close audio stream and free memory
    ray_alias_object :IsAudioBufferProcessed,   :buffer_processed?        # Check if any audio stream buffers requires refill
    ray_alias_object :PlayAudioStream,          :play                     # Play audio stream
    ray_alias_object :PauseAudioStream,         :pause                    # Pause audio stream
    ray_alias_object :ResumeAudioStream,        :resume                   # Resume audio stream
    ray_alias_object :IsAudioStreamPlaying,     :is_playing?              # Check if audio stream is playing
    ray_alias_object :StopAudioStream,          :stop                     # Stop audio stream
    ray_alias_object :SetAudioStreamVolume,     :volume=                  # Set volume for audio stream (1.0 is max level)
    ray_alias_object :SetAudioStreamPitch,      :pitch=                   # Set pitch for audio stream (1.0 is base level)
  end
end
