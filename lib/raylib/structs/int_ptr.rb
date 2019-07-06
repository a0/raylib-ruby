module Raylib
  class IntPtr < FFI::Struct
    layout :value, :int

    ray_struct_init_accessor :value
  end
end
