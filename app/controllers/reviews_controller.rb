class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    api = Api.find(params[:api_id])
    review = Review.new(review_params)
    review.user = current_user
    review.api = api

    if review.save
      ReviewMailer.new_review(review).deliver_later
      flash[:success] = 'Review Submitted!'
    else
      flash[:failure] = review.errors.full_messages.join(', ')
      flash[:failure] += '. Review Not Submitted'
    end
    redirect_to api_path(api)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
