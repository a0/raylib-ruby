module Raylib # rubocop:disable Metrics/ModuleLength Metrics/LineLength
  extend FFI::Library

  ffi_lib 'raylib'
end

require_relative 'functions/raylib'
require_relative 'functions/raymath'
require_relative 'functions/rlgl'
