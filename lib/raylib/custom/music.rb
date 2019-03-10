module Raylib
  class Music
    # Music management functions
    ray_alias_static :LoadMusicStream,    :load           # Load music stream from file
    ray_alias_object :UnloadMusicStream,  :unload         # Unload music stream
    ray_alias_object :PlayMusicStream,    :play           # Start music playing
    ray_alias_object :UpdateMusicStream,  :update         # Updates buffers for music streaming
    ray_alias_object :StopMusicStream,    :stop           # Stop music playing
    ray_alias_object :PauseMusicStream,   :pause          # Pause music playing
    ray_alias_object :ResumeMusicStream,  :resume         # Resume playing paused music
    ray_alias_object :IsMusicPlaying,     :is_playing?    # Check if music is playing
    ray_alias_object :SetMusicVolume,     :volume=        # Set volume for music (1.0 is max level)
    ray_alias_object :SetMusicPitch,      :pitch=         # Set pitch for a music (1.0 is base level)
    ray_alias_object :SetMusicLoopCount,  :loop_count=    # Set music loop count (loop repeats)
    ray_alias_object :GetMusicTimeLength, :time_length    # Get music time length (in seconds)
    ray_alias_object :GetMusicTimePlayed, :time_played    # Get current music time played (in seconds)  
  end
end
