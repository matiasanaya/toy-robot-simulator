Gem::Specification.new do |spec|
  spec.name          = 'toy_robot'
  spec.version       = '0.0.1'
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

  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'minitest', '~> 5.4.1'
end
