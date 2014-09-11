Gem::Specification.new do |spec|
  spec.name          = 'toy_robot'
  spec.version       = '0.0.2'
  spec.authors       = ['Matias Anaya']
  spec.email         = ['matiasanaya@gmail.com']
  spec.summary       = %q{A toy robot simulator}
  spec.description   = %q{A toy robot that rules a 5x5 board.}
  spec.homepage      = 'https://github.com/matiasanaya/toy-robot-simulator'
  spec.license       = 'UNLICENSE'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['toy_robot']
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.1'

  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'minitest', '~> 4.7', '>= 4.7.5'
end
