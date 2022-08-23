# -*- encoding: utf-8 -*-
# stub: jquery-star-rating-rails 4.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-star-rating-rails".freeze
  s.version = "4.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rich Grundy".freeze]
  s.date = "2013-03-13"
  s.description = "This gem provides the star rating jQuery plugin from fyneworks to your Rails 3.1 and above applications.".freeze
  s.email = ["rich@27smiles.com".freeze]
  s.homepage = "http://github.com/richguk/jquery-star-rating-rails".freeze
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Use jQuery star rating from fyneworks with Rails 3.1".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 3.1.0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.1.0"])
  end
end
