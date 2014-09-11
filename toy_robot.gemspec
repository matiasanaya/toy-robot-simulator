# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'toy_robot'
  spec.version       = '0.0.0'
  spec.authors       = ['Matias Anaya']
  spec.email         = ['matiasanaya@gmail.com']
  spec.summary       = %q{A toy robot simulator}
  spec.description   = %q{A toy robot that rules a 5x5 board.}
  spec.homepage      = 'https://github.com/matiasanaya/toy_robot'
  spec.license       = 'UNLICENSE'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['toy_robot']
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
end
