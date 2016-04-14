class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail( from: "admin@api-addicts.herokuapp.com",
          to: "brett.mordas@gmail.com",
          subject: "New Review for #{review.api.name}"
    )
  end
end
