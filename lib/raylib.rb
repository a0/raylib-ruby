require 'ffi'

module Raylib
  extend FFI::Library

  ffi_lib 'raylib'
end

require_relative 'raylib/helpers'
require_relative 'raylib/types'
require_relative 'raylib/constants'
require_relative 'raylib/enums'
require_relative 'raylib/structs'
require_relative 'raylib/aliases'
require_relative 'raylib/functions'
require_relative 'raylib/custom'
require_relative 'raylib/version'
