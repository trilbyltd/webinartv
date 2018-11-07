ENV["RAILS_ENV"] = 'test'
if ENV.fetch("COVERAGE", false)
  require "simplecov"
  if ENV["CIRCLE_ARTIFACTS"]
    dir = File.join(ENV["CIRCLE_ARTIFACTS"], "coverage")
    SimpleCov.coverage_dir(dir)
  end
  SimpleCov.start "rails"
end

require_relative '../config/environment'
require 'database_cleaner'
require 'shoulda-matchers'
require 'formulaic'
require 'rspec/rails'
require 'capybara/rspec'
require 'webmock/rspec'
# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

RSpec.configure do |config|
  ActiveJob::Base.queue_adapter = :test
  config.include Formulaic::Dsl, type: :feature

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random

  # Capybara.javascript_driver = :webkit
  WebMock.disable_net_connect!(allow_localhost: true)
end
