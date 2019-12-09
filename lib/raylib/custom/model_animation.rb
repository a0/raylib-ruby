module Raylib
  class ModelAnimation
    extend FFIAttach

    #------------------------------------------------------------------------------------
    # Model 3d Loading and Drawing Functions (Module: models)
    #------------------------------------------------------------------------------------

    # Model animations loading/unloading functions
    ray_static :LoadModelAnimations, :load, %i[string pointer], :pointer do |_function, name, _mapping| # Load model animations from file
      singleton_class.define_method name do |filename|
        model_animation_count = IntPtr.new
        result = Raylib.LoadModelAnimations filename, model_animation_count
        result.read_array_of_pointer(model_animation_count.value).map { |pointer| ModelAnimation.new pointer }
      end
    end

    ray_object :UnloadModelAnimation, :unload, [ModelAnimation.by_value], :void # Unload animation data
  end
end
