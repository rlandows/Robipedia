ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:        'smtp.sendgrid.net',
  port:           '2525',
  authentication: :plain,
  user_name:      ENV['app62870580@heroku.com'],
  password:       ENV['bykzjd3u5759'],
  domain:         'heroku.com',
  enable_starttls_auto: true
}
