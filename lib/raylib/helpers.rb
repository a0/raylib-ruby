require_relative 'helpers/enum'
require_relative 'helpers/ffi_attach'
require_relative 'helpers/ffi_struct'
require_relative 'helpers/mapping'

# FIXME: Remove this
class Class
  def ray_alias_object(function, name, pos = :first)
    @@ray_deprecated ||= 0
    @@ray_deprecated += 1
    warn "Deprecated ##{@@ray_deprecated} ray_alias_object function: #{function} name: #{name} pos: #{pos}"
    if pos == :first
      define_method name do |*args|
        Raylib.send(function, self, *args)
      end
    elsif pos == :last
      define_method name do |*args|
        Raylib.send(function, *args, self)
      end
    end
  end

  def ray_alias_static(function, name)
    @@ray_deprecated ||= 0
    @@ray_deprecated += 1

    warn "Deprecated ##{@@ray_deprecated} ray_alias_static function: #{function} name: #{name}"
    singleton_class.define_method name do |*args|
      Raylib.send(function, *args)
    end
  end
end
