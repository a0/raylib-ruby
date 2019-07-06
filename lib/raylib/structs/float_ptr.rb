module Raylib
  class FloatPtr < FFI::Struct
    layout :value, :float

    ray_struct_init_accessor :value
  end
end
