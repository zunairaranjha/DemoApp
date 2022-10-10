source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem 'faker'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
# Use postgresql as the database for Active Record
 gem "pg"
gem 'simple_form', '~> 5.1'
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"
gem 'devise', '~> 4.8', '>= 4.8.1'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
gem 'jquery-star-rating-rails', '~> 4.0', '>= 4.0.4'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# gem 'redis'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
gem "graphql"
gem 'rails_rate_limiter'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
  # gem "kredis"

gem 'algoliasearch-rails'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bundler'
# gem 'bundler-unload'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
 gem 'rack-attack'
# Use Sass to process CSS
gem "sassc-rails"

# gem 'nokogiri', '~> 1.13', '>= 1.13.8'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # gem 'grape'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'bcrypt', '~> 3.1.13'

 gem 'actiontext'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  # gem "capybara"
  # gem "webdrivers"
  # gem 'webdrivers', '~> 3.1'

  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

  # gem 'rspec-rails'

end
# TODO need to check do we only need this gem only in Developement
gem "graphiql-rails", group: :development

gem "algolia", "~> 2.2"

