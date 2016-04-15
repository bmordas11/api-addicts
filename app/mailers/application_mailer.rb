class ApplicationMailer < ActionMailer::Base
  default from: 'WHATEVER_YOUR_EMAIL_IS'

  def review_mailer(user)
    @user = user
    mail(to: @user.email_address, subject: "Welcome!")
  end
end
