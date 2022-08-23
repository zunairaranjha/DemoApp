lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_rate_limiter/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_rate_limiter'
  spec.version       = RailsRateLimiter::VERSION
  spec.authors       = ['Ruslan Kotov']
  spec.email         = %w[rkotov93@gmail.com]

  spec.summary       = 'Requests rate limiting library for Ruby on Rails'
  spec.homepage      = 'https://github.com/rkotov93/rails_rate_limiter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '>= 4.2'
  spec.add_runtime_dependency 'redis', '>= 3.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'mock_redis'
end
