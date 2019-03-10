module Raylib
  class Sound
    # Wave/Sound loading/unloading functions
    ray_alias_static :LoadSound,    :load           # Load sound from file
    ray_alias_object :UpdateSound,  :update         # Update sound buffer with new data
    ray_alias_object :UnloadSound,  :unload         # Unload sound

    # Wave/Sound management functions
    ray_alias_object :PlaySound,      :play         # Play a sound
    ray_alias_object :PauseSound,     :pause        # Pause a sound
    ray_alias_object :ResumeSound,    :resume       # Resume a paused sound
    ray_alias_object :StopSound,      :stop         # Stop playing a sound
    ray_alias_object :IsSoundPlaying, :is_playing?  # Check if a sound is currently playing
    ray_alias_object :SetSoundVolume, :volume=      # Set volume for a sound (1.0 is max level)
    ray_alias_object :SetSoundPitch,  :pitch=       # Set pitch for a sound (1.0 is base level)
  end
end
