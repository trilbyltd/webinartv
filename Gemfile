source 'https://rubygems.org'

ruby '2.5.1'

gem 'autoprefixer-rails'
gem 'mini_racer', platforms: :ruby
gem 'bourbon', '5.0.0.beta.5'
gem 'clearance', '~> 1.13'
gem 'coffee-rails', '~> 4.2.2'
gem 'email_validator'
gem 'flutie'
gem 'font-awesome-rails'
gem 'high_voltage'
gem 'icalendar'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'neat', '~> 1.9.0'
gem 'newrelic_rpm', '>= 3.9.8'
gem 'normalize-rails', '~> 3.0.0'
gem 'pg', '~> 0.21.0'
gem 'puma'
gem 'rack-canonical-host'
gem 'rails', '~> 5.0.0'
gem 'resque'
gem 'resque-rollbar'
gem 'resque-scheduler'
gem 'rollbar'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'simple_form_extension'
gem 'sprockets', '>= 3.0.0'
gem 'sprockets-es6'
gem 'title'
gem 'uglifier'

group :development do
  gem 'pry-byebug'
  gem 'pry-rails'
  # gem 'quiet_assets'
  gem 'refills'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git' # forcing https because bundle-audit fails git://
  gem 'rspec-rails', '~> 3.8.0'
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'rubocop', require: false
end

group :development, :staging do
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'capybara-email'
  gem 'capybara-webkit', '~> 1.15.1'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging do
  gem 'recipient_interceptor'
end

group :staging, :production do
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
end

gem 'redactor-rails', git: 'https://github.com/glyph-fr/redactor-rails'
