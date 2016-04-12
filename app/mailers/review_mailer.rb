class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.api.user.email,
      subject: "New Review for #{review.api.name}"
    )
  end
end
