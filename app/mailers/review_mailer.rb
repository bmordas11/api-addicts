class ReviewMailer < ApplicationMailer
  def new_review(review)
    # if Rails.env.production? || Rails.env.development?
    #   mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    #   message_params = { from: ENV['GMAIL_USERNAME'],
    #                      to: review.api.user.email,
    #                      subject: "New Review for #{review.api.name}"
    #                    }
    #   mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
    # elsif Rails.env.test? || Rails.env.development?
      @review = review
      mail(
        to: review.api.user.email,
        subject: "New Review for #{review.api.name}"
      )
    # end
  end
end
