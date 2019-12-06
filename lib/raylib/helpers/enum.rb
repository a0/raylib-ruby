module Raylib
  def self.ray_alias_enum(enum, function, name)
    enum.define_singleton_method name do |*args|
      Raylib.send(function, *args)
    end
  end
end
