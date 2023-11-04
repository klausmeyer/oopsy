source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Sass to process CSS
gem "sassc-rails"

# State machine: https://github.com/aasm/aasm
gem "aasm", "~> 5.5.0"

# Admin UI: https://github.com/TrestleAdmin/trestle
gem "trestle", "~> 0.9"

# Admin UI Auth: https://github.com/TrestleAdmin/trestle-auth
gem "trestle-auth", "~> 0.4"

# Sidekiq integration plugin for the Trestle admin framework: https://github.com/TrestleAdmin/trestle-sidekiq
gem "trestle-sidekiq", "~> 0.1"

# Syntax Highlighter: https://github.com/rouge-ruby/rouge
gem "rouge", "~> 4.0"

# Background Jobs: https://github.com/mperham/sidekiq
gem "sidekiq", "~> 7.0"

# Simple health check of Rails app: https://github.com/Purple-Devs/health_check
gem "health_check", "~> 3.1"

# Simple, but flexible HTTP client library, with support for multiple backends: https://github.com/lostisland/faraday
gem "faraday", "~> 2.7"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # A Ruby gem to load environment variables from `.env`: https://github.com/bkeepers/dotenv
  gem "dotenv-rails", "~> 2.8"

  # Testing framework: https://github.com/rspec/rspec-rails
  gem "rspec-rails", "~> 6.0"

  # Fixtures replacement: https://github.com/thoughtbot/factory_bot_rails
  gem "factory_bot_rails", "~> 6.2"

  # Ruby style guide, linter, and formatter: https://github.com/testdouble/standard
  gem "standard", "~> 1.10"

  # Code coverage: https://github.com/simplecov-ruby/simplecov
  gem "simplecov", "~> 0.22.0", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  # gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # A plain Ruby Airbrake notifier: https://github.com/airbrake/airbrake-ruby
  # Used for compatibility testing
  gem "airbrake-ruby", "~> 6.1"

  # Library for stubbing and setting expectations on HTTP requests in Ruby: https://github.com/bblimke/webmock
  gem "webmock", "~> 3.19"
end
