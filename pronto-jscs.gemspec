# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pronto/jscs/version'

Gem::Specification.new do |spec|
  spec.name          = 'pronto-jscs'
  spec.version       = Pronto::JSCS::VERSION
  spec.authors       = ['Tomas Varaneckas']
  spec.email         = ['tomas.varaneckas@gmail.com']
  spec.summary       = 'Pronto runner for JSCS, JavaScript Code Style checker'
  spec.homepage      = 'http://github.org/spajus/pronto-jscs'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('pronto', '~> 0.7.0')
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'rspec-its', '~> 1.2'
end
