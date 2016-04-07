class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @api = Api.find(params[:api_id])
    @review = Review.new(review_params)
    @review.api = @api
    @review.rating = params[:review][:rating].to_i
    @review.user = current_user
    @reviews = @api.reviews.order(created_at: :asc)

    if @review.save
      flash[:success] = 'Review Submitted!'
      redirect_to api_path(@api)
    else
      flash[:failure] = @review.errors.full_messages.join(', ')
      flash[:failure] += '. Review Not Submitted'
      render 'apis/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
