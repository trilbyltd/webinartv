require_relative "production"

Mail.register_interceptor(
  RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS", ""))
)

Rails.application.configure do
  config.force_ssl = true
  config.assets.compile = true
end
