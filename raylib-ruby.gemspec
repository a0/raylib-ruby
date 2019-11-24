lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'raylib/version'

Gem::Specification.new do |spec|
  spec.name          = 'raylib'
  spec.version       = Raylib::VERSION
  spec.authors       = ['Aldrin Martoq']
  spec.email         = ['contacto@a0.cl']

  spec.summary       = 'A ruby FFI wrapper for raylib.com'
  spec.description   = 'You can program powerful games in ruby!'
  spec.homepage      = 'https://github.com/a0/raylib-ruby'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/a0/raylib-ruby/'
    spec.metadata['changelog_uri'] = 'https://github.com/a0/raylib-ruby/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|examples)/}) }
  end

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'glfw3'

  spec.add_runtime_dependency 'glfw3'
  spec.add_runtime_dependency 'ffi'
end
