module Raylib
  # Trace log type
  TraceLogType = enum(
    :all, 0,                      # Display all logs
    :trace,
    :debug,
    :info,
    :warning,
    :error,
    :fatal,
    :none                         # Disable logging
  )
end
