class ReviewsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

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
      flash[:success] = 'Review Submitted!'
      redirect_to api_path(api)
    else
      flash[:failure] = review.errors.full_messages.join(', ')
      flash[:failure] += '. Review Not Submitted'
      redirect_to api_path(api)
    end
  end

  def edit
    @api = Api.find(params[:api_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to apis_path
      flash[:success] = "Review Updated!"
    else
      flash[:failure] = "Review Not Updated!"
      render :edit
    end
  end

  def destroy
    @api = Api.find(params[:api_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = "Review has been deleted"
      redirect_to apis_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
