class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: review.api.user.email,
      subject: "New Review for #{review.api.name}"
    )
  end

  def send_new_review_message(review)
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
      "@api.mailgun.net/v3/#{ENV['MAILGUN_DOMAIN']}/messages",
      from: "Excited User <mailgun@#{ENV['MAILGUN_DOMAIN']}>",
      to: "brett.mordas@gmail.com, brett.mordas@gmail.com",
      subject: "Hello",
      text: "Testing some Mailgun awesomness! #{review.body}"
  end
end
