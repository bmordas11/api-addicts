class ApplicationMailer < ActionMailer::Base
  default from: 'WHATEVER_YOUR_EMAIL_IS'

  def review_mailer(user)
    @user = user
    mail(to: 'efournier92@gmail.com', subject: "Welcome!")
  end
end
