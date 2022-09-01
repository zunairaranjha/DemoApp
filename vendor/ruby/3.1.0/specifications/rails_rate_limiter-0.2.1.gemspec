# -*- encoding: utf-8 -*-
# stub: rails_rate_limiter 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_rate_limiter".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ruslan Kotov".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-02-04"
  s.email = ["rkotov93@gmail.com".freeze]
  s.homepage = "https://github.com/rkotov93/rails_rate_limiter".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Requests rate limiting library for Ruby on Rails".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 4.2"])
    s.add_runtime_dependency(%q<redis>.freeze, [">= 3.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<mock_redis>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.2"])
    s.add_dependency(%q<redis>.freeze, [">= 3.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<mock_redis>.freeze, [">= 0"])
  end
end
