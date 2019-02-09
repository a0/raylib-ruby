class Class
  def ray_struct_accessor(*attrs)
    attrs.each do |attr|
      define_method attr do
        self[attr]
      end
      define_method "#{attr}=" do |val|
        self[attr] = val
      end
    end
  end

  def ray_struct_init_accessor(*attrs)
    ray_struct_accessor(*attrs)

    define_method :initialize do |*args|
      if args.count == 1 && (args.first.class == FFI::MemoryPointer || args.first.class == FFI::Pointer)
        super(*args)
        return
      end
      raise "Expected #{attrs.count} arguments, got #{args.count} #{args} #{self.class}" unless attrs.count == args.count

      args.each_with_index do |arg, index|
        self[attrs[index]] = arg
      end
    end
  end

  def ray_alias_object(function, name, pos = :first)
    if pos == :last
      define_method name do |*args|
        Raylib.send(function, *args, self)
      end
    elsif pos == :first
      define_method name do |*args|
        Raylib.send(function, self, *args)
      end
    end
  end

  def ray_alias_static(function, name)
    singleton_class.define_method name do |*args|
      Raylib.send(function, *args)
    end
  end
end
