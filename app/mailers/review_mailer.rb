class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(from: "admin@api-addicts.herokuapp.com",
        #  to: review.api.user.email,
        to: "efournier92@gmail.com"
         subject: "New Review for #{review.api.name}"
         )
  end
end
