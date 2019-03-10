require_relative 'custom/audio_device'
require_relative 'custom/audio_stream'
require_relative 'custom/bounding_box'
require_relative 'custom/camera2d'
require_relative 'custom/camera3d'
require_relative 'custom/collision'
require_relative 'custom/color'
require_relative 'custom/cursor'
require_relative 'custom/draw'
require_relative 'custom/font'
require_relative 'custom/gamepad'
require_relative 'custom/image'
require_relative 'custom/key'
require_relative 'custom/material'
require_relative 'custom/mesh'
require_relative 'custom/model'
require_relative 'custom/mouse'
require_relative 'custom/music'
require_relative 'custom/ray'
require_relative 'custom/rectangle'
require_relative 'custom/render_texture2d'
require_relative 'custom/shader'
require_relative 'custom/sound'
require_relative 'custom/texture2d'
require_relative 'custom/touch'
require_relative 'custom/vr_device_info'
require_relative 'custom/wave'
require_relative 'custom/window'

module Raylib
  # Misc. functions
  Raylib.singleton_class.send :alias_method, :show_logo,        :ShowLogo         # Activate raylib logo at startup (can be done with flags)
  Raylib.singleton_class.send :alias_method, :config_flags=,    :SetConfigFlags   # Setup window configuration flags (view FLAGS)
  Raylib.singleton_class.send :alias_method, :trace_log=,       :SetTraceLog      # Enable trace log message types (bit flags based)
  Raylib.singleton_class.send :alias_method, :trace_log,        :TraceLog         # Show trace log messages (LOG_INFO, LOG_WARNING, LOG_ERROR, LOG_DEBUG)
  Raylib.singleton_class.send :alias_method, :take_screenshot,  :TakeScreenshot   # Takes a screenshot of current screen (saved a .png)
  Raylib.singleton_class.send :alias_method, :random_value,     :GetRandomValue   # Returns a random value between min and max (both included)

  # Files management functions
  Raylib.singleton_class.send :alias_method, :is_file_extension?,     :IsFileExtension      # Check file extension
  Raylib.singleton_class.send :alias_method, :get_extension,          :GetExtension         # Get pointer to extension for a filename string
  Raylib.singleton_class.send :alias_method, :get_file_name,          :GetFileName          # Get pointer to filename for a path string
  Raylib.singleton_class.send :alias_method, :get_directory_path,     :GetDirectoryPath     # Get full path for a given fileName (uses static string)
  Raylib.singleton_class.send :alias_method, :get_working_directory,  :GetWorkingDirectory  # Get current working directory (uses static string)
  Raylib.singleton_class.send :alias_method, :change_directory,       :ChangeDirectory      # Change working directory, returns true if success
  Raylib.singleton_class.send :alias_method, :is_file_dropped?,       :IsFileDropped        # Check if a file has been dropped into window
  Raylib.singleton_class.send :alias_method, :get_dropped_files,      :GetDroppedFiles      # Get dropped files names
  Raylib.singleton_class.send :alias_method, :clear_dropped_files,    :ClearDroppedFiles    # Clear dropped files paths buffer

  # Persistent storage management
  Raylib.singleton_class.send :alias_method, :storage_save_value,     :StorageSaveValue     # Save integer value to storage file (to defined position)
  Raylib.singleton_class.send :alias_method, :storage_load_value,     :StorageLoadValue     # Load integer value from storage file (from defined position)

  # Shader loading/unloading functions
  Raylib.singleton_class.send :alias_method, :load_text,              :LoadText # Load chars array from text file
end
