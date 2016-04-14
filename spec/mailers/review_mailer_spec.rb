require 'rails_helper'

RSpec.describe ReviewMailer do
  describe 'instructions' do
    it 'renders the subject' do
      review = FactoryGirl.create(:review)
      mail = ReviewMailer.new_review(review).deliver_now
      expect(mail.subject).to eq("New Review for #{review.api.name}")
    end

    it 'renders the receiver email' do
      review = FactoryGirl.create(:review)
      mail = ReviewMailer.new_review(review).deliver_now
      expect(mail.to).to eq([review.api.user.email])
    end

    it 'renders the sender email' do
      review = FactoryGirl.create(:review)
      mail = ReviewMailer.new_review(review).deliver_now
      expect(mail.from).to eq(
        ["admin@api-addicts.herokuapp.com"]
      )
    end

    it 'assigns @name' do
      review = FactoryGirl.create(:review)
      mail = ReviewMailer.new_review(review).deliver_now
      expect(mail.body.encoded).to match(review.api.user.name)
    end
  end
end
