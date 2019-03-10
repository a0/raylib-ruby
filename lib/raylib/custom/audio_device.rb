module Raylib
  class AudioDevice
    # Audio device management functions
    ray_alias_static :InitAudioDevice, :init            # Initialize audio device and context
    ray_alias_static :CloseAudioDevice, :close          # Close the audio device and context
    ray_alias_static :IsAudioDeviceReady, :is_ready?    # Check if audio device has been initialized successfully
    ray_alias_static :SetMasterVolume, :master_volume=  # Set master volume (listener)
  end
end
