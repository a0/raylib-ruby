require_relative 'custom/audio_device'
require_relative 'custom/audio_stream'
require_relative 'custom/bounding_box'
require_relative 'custom/camera2d'
require_relative 'custom/camera3d'
require_relative 'custom/clipboard'
require_relative 'custom/collision'
require_relative 'custom/color'
require_relative 'custom/cursor'
require_relative 'custom/draw'
require_relative 'custom/font'
require_relative 'custom/gamepad'
require_relative 'custom/image'
require_relative 'custom/key'
require_relative 'custom/material'
require_relative 'custom/matrix'
require_relative 'custom/mesh'
require_relative 'custom/model'
require_relative 'custom/model_animation'
require_relative 'custom/monitor'
require_relative 'custom/mouse'
require_relative 'custom/music'
require_relative 'custom/ray'
require_relative 'custom/rectangle'
require_relative 'custom/render_texture2d'
require_relative 'custom/rlgl'
require_relative 'custom/shader'
require_relative 'custom/sound'
require_relative 'custom/texture2d'
require_relative 'custom/touch'
require_relative 'custom/vector3'
require_relative 'custom/vr_device_info'
require_relative 'custom/wave'
require_relative 'custom/window'

module Raylib
  extend FFIAttach

  # Callbacks to be implemented by users
  # raylib-ruby NOTE: Not implemented because FFI can't accept varargs in callbacks
  # callback :trace_log_callback, [TraceLogType, :string, :varargs], :void

  #------------------------------------------------------------------------------------
  # Window and Graphics Device Functions (Module: core)
  #------------------------------------------------------------------------------------

  # Misc. functions
  ray_static :SetConfigFlags,       :config_flags=,           %i[uchar], :void                            # Setup window configuration flags (view FLAGS)
  ray_static :SetTraceLogLevel,     :log_level=,              [TraceLogType], :void                       # Set the current threshold (minimum) log level
  ray_static :SetTraceLogExit,      :log_exit=,               [TraceLogType], :void                       # Set the exit threshold (minimum) log level
  # ray_static :SetTraceLogCallback,:log_callback=,           %i[trace_log_callback], :void               # Set a trace log callback to enable custom logging
  ray_static :TraceLog,             :log,                     [TraceLogType, :string, :varargs], :void    # Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
  ray_static :TakeScreenshot,       :screenshot,              %i[string], :void                           # Takes a screenshot of current screen (saved a .png)
  ray_static :GetRandomValue,       :random_value,            %i[int int], :int                           # Returns a random value between min and max (both included)

  # Files management functions
  ray_static :FileExists,             :file_exists?,          %i[string], :bool                           # Check if file exists
  ray_static :IsFileExtension,        :file_extension?,       %i[string string], :bool                    # Check file extension
  ray_static :DirectoryExists,        :directory_exists?,     %i[string], :bool                           # Check if a directory path exists
  ray_static :GetExtension,           :extension,             %i[string], :string                         # Get pointer to extension for a filename string
  ray_static :GetFileName,            :file_name,             %i[string], :string                         # Get pointer to filename for a path string
  ray_static :GetFileNameWithoutExt,  :file_name_without_ext, %i[string], :string                         # Get filename string without extension (uses static string)
  ray_static :GetDirectoryPath,       :directory_path,        %i[string], :string                         # Get full path for a given fileName with path (uses static string)
  ray_static :GetPrevDirectoryPath,   :prev_directory_path,   %i[string], :string                         # Get previous directory path for a given path (uses static string)
  ray_static :GetWorkingDirectory,    :working_directory,     %i[void], :string                           # Get current working directory (uses static string)
  ray_static :GetDirectoryFiles,      :directory_files,       %i[string pointer], :pointer                # Get filenames in a directory path (memory should be freed)
  ray_static :ClearDirectoryFiles,    :clear_directory_files, %i[void], :void                             # Clear directory files paths buffers (free memory)
  ray_static :ChangeDirectory,        :change_directory,      %i[string], :bool                           # Change working directory, returns true if success
  ray_static :IsFileDropped,          :file_dropped?,         %i[void], :bool                             # Check if a file has been dropped into window
  ray_static :GetDroppedFiles,        :dropped_files,         %i[pointer], :pointer                       # Get dropped files names (memory should be freed)
  ray_static :ClearDroppedFiles,      :clear_dropped_files,   %i[void], :void                             # Clear dropped files paths buffer (free memory)
  ray_static :GetFileModTime,         :file_mod_time,         %i[string], :long                           # Get file modification time (last write time)

  ray_static :CompressData,           :compress_data,         %i[string int pointer], :string             # Compress data (DEFLATE algorythm)
  ray_static :DecompressData,         :decompress_data,       %i[string int pointer], :string             # Decompress data (DEFLATE algorythm)

  # Persistent storage management
  ray_static :StorageSaveValue,       :storage_save_value,    %i[int int], :void                          # Save integer value to storage file (to defined position)
  ray_static :StorageLoadValue,       :storage_load_value,    %i[int], :int                               # Load integer value from storage file (from defined position)

  ray_static :OpenURL,                :open_url,              %i[string], :void                           # Open URL with default system browser (if available)







  
  # Shader loading/unloading functions
  Raylib.singleton_class.send :alias_method, :load_text,              :LoadText # Load chars array from text file

  #
  # raymath.h
  #

  # Utils math
  Raylib.singleton_class.send :alias_method, :clamp,                  :Clamp                # Clamp float value
  Raylib.singleton_class.send :alias_method, :lerp,                   :Lerp                 # Calculate linear interpolation between two vectors
end
