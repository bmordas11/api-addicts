class ReviewMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    review = FactoryGirl.create(:review)

    ReviewMailer.new_review(review)
  end
end
