# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key   = Rails.application.credentials.dig(:recaptcha, :v3, :site_key)
  config.secret_key = Rails.application.credentials.dig(:recaptcha, :v3, :secret_key)
end
