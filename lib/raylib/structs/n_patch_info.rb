require_relative 'rectangle'

module Raylib
  # N-Patch layout info
  class NPatchInfo
    layout  :source_rec,  Rectangle,  # Region in the texture
            :left,        :int,       # left border offset
            :top,         :int,       # top border offset
            :right,       :int,       # right border offset
            :bottom,      :int,       # bottom border offset
            :type,        :int        # layout of the n-patch: 3x3, 1x3 or 3x1

    ray_struct_init_accessor :source_rec, :left, :top, :right, :bottom, :type
  end
end
