module Raylib
  module FFIAttach
    def ray_static(function, name, params, returns, target = singleton_class)
      Raylib.attach_function function, params, returns
      mapping = ray_mapping params

      if block_given?
        yield function, name, mapping
      elsif mapping.empty?
        target.define_method name do |*args|
          Raylib.send(function, *args)
        end
      else
        target.define_method name do |*args|
          mapping.each do |index, struct_class|
            args[index] = struct_class[args[index]] || args[index]
          end
          Raylib.send(function, *args)
        end
      end
    end

    def ray_object(function, name, params, returns, pos = :first)
      Raylib.attach_function function, params, returns
      mapping = ray_mapping params

      if block_given?
        yield function, name, mapping
      elsif pos == :first
        ray_object_first function, name, mapping
      elsif pos == :last
        ray_object_last function, name, mapping
      end
    end

    def ray_object_first(function, name, mapping)
      if mapping.empty?
        define_method name do |*args|
          Raylib.send(function, self, *args)
        end
      else
        define_method name do |*args|
          args.unshift self
          mapping.each do |index, struct_class|
            args[index] = struct_class[args[index]] || args[index]
          end
          Raylib.send(function, *args)
        end
      end
    end

    def ray_object_last(function, name, mapping)
      if mapping.empty?
        define_method name do |*args|
          Raylib.send(function, *args, self)
        end
      else
        define_method name do |*args|
          args.push self
          mapping.each do |index, struct_class|
            args[index] = struct_class[args[index]] || args[index]
          end
          Raylib.send(function, *args)
        end
      end
    end

    def ray_mapping(params)
      params.each_with_index.map do |arg, index|
        next unless arg.is_a?(FFI::StructByValue) && arg.struct_class.respond_to?(:ray_map)

        [index, arg.struct_class]
      end.compact.to_h
    end
  end
end
