Clearance.configure do |config|
  config.allow_sign_up = true
  # config.cookie_domain = '.example.com'
  config.cookie_expiration = lambda { |cookies| 7.days.from_now.utc }
  # config.cookie_name = 'remember_token'
  # config.cookie_path = '/'
  config.routes = false
  # config.httponly = false
  config.mailer_sender = "reply@example.com"
  # config.password_strategy = Clearance::PasswordStrategies::BCrypt
  # config.redirect_url = '/'
  config.secure_cookie = true
  # config.sign_in_guards = []
  # config.user_model = User
end
