# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/unicorn/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'rake-unicorn-rails'
  spec.version       = Rake::Unicorn::Rails::VERSION
  spec.authors       = ['cyrill']
  spec.email         = ['siril.taka@gmail.com']
  spec.licenses      = ['MIT']

  spec.summary       = %q{Supply unicorn start/stop rake tasks}
  spec.description   = %q{Supply unicorn start/stop/reload/restart rake tasks}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '>= 4.2', '< 5.2'
  spec.add_runtime_dependency 'rake', '~> 12.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
