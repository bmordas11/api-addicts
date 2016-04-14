class ApplicationMailer < ActionMailer::Base
  default from: "\"API-Addicts Review Site\"\
    <admin@api-addicts.herokuapp.com>"
  layout 'mailer'

  Mailgun.configure do |config|
    config.api_key = ENV['MAILGUN_API_KEY']
  end
end
