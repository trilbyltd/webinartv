ENV["RAILS_ENV"] = 'test'
require_relative 'spec_helper'
require_relative '../config/environment'

require "rspec/rails"
require "clearance/rspec"
require "capybara/webkit"
require "capybara/email/rspec"

abort("DATABASE_URL environment variable is set") if Rails.env.production?
abort("This isn't the test environment. We're in #{Rails.env}") if !Rails.env.test?

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl
end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.include FactoryBot::Syntax::Methods
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  Capybara.default_selector = :css
end

# ActiveRecord::Migration.maintain_test_schema!
