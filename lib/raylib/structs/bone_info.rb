module Raylib
  # Bone information
  class BoneInfo
    layout  :name,    [:char, 32],  # Bone name
            :parent,  :int          # Bone parent

    ray_struct_accessor :name, :parent
  end
end
