module Raylib
  module Mapping
    def ray_map(name, *args)
      @kv_map ||= {}
      @kv_map[name] = new(*args)
    end

    def [](name)
      @kv_map[name]
    end
  end
end
