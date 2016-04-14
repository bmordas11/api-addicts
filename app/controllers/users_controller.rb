class UsersController < ApplicationController
  def index
  end

  def show
    @user         = User.find(params[:id])
    @user_apis    = Api.where(user_id: current_user)
    @user_reviews = Review.where(user_id: current_user)
  end

end
