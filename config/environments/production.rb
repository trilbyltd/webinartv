require Rails.root.join("config/smtp")
Rails.application.configure do
  if ENV.fetch("HEROKU_APP_NAME", "").include?("staging-pr-")
    ENV["APPLICATION_HOST"] = ENV["HEROKU_APP_NAME"] + ".herokuapp.com"
  end
  config.middleware.use Rack::CanonicalHost, ENV.fetch("APPLICATION_HOST")
  config.force_ssl = true
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=3600' }
  config.middleware.use Rack::Deflater
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :debug
  config.action_controller.asset_host = ENV.fetch("ASSET_HOST", ENV.fetch("APPLICATION_HOST"))
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = SMTP_SETTINGS
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { host: ENV.fetch("APPLICATION_HOST") }
end
# Clearance.configure do |config|
#   config.allow_sign_up = true
#   config.cookie_domain = ENV.fetch('APPLICATION_HOST')
#   # config.cookie_expiration = lambda { |cookies| 7.days.from_now.utc }
#   config.routes = false
#   # config.httponly = false
#   config.secure_cookie = true
# end
