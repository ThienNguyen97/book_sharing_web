Devise.setup do |config|

  config.mailer_sender = ENV["GMAIL_USERNAME"]

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.omniauth :google_oauth2, ENV['GOOGLE_OAUTH2_APP_ID'], ENV['GOOGLE_OAUTH2_APP_SECRET'], { scope: "https://www.googleapis.com/auth/userinfo.email" }
 config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], { scope: "email" }

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = Settings.minimum_length_pass..Settings.maximum_length_pass

  config.email_regexp = URI::MailTo::EMAIL_REGEXP
  config.reset_password_within = Settings.reset_password_within.hours

  config.sign_out_via = :delete
end
