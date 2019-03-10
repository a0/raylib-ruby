module Raylib
  class Wave
    # Wave/Sound loading/unloading functions
    ray_alias_static :LoadWave,           :load           # Load wave data from file
    ray_alias_static :LoadWaveEx,         :load_ex        # Load wave data from raw array data
    ray_alias_object :LoadSoundFromWave,  :to_sound       # Load sound from wave data
    ray_alias_object :UnloadWave,         :unload         # Unload wave data

    # Wave/Sound management functions
    ray_alias_object :WaveFormat,         :format!        # Convert wave data to desired format
    ray_alias_object :WaveCopy,           :copy           # Copy a wave to a new wave
    ray_alias_object :WaveCrop,           :crop!          # Crop a wave to defined samples range
    ray_alias_object :GetWaveData,        :to_data        # Get samples data from wave as a floats array
  end
end
