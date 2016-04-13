class ApplicationMailer < ActionMailer::Base
  # default from: "\"API-Addicts Review Site\" <thebeanman100@yahoo.com>"
  # layout 'mailer'

  Mailgun.configure do |config|
    config.api_key = ENV['MAILGUN_API_KEY']
  end
end
