class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @apis = @user.apis
    @reviews = @user.reviews
  end

  def destroy
    @user = User.find(params[:id])
    @apis = @user.apis
    @reviews = @user.reviews
    if @user.destroy
      flash[:success] = "User has been Permanently deleted from DB!"
      redirect_to users_path
    end
    @apis.each do |api|
      @api = api
      if @api.destroy
        flash[:success] = "Api has been Permanently deleted from DB!"
        redirect_to user_path(user)
      end
      @reviews.each do |review|
        @review = review
        if @review.destroy
          flash[:success] = "Review has been Permanently deleted from DB!"
          redirect_to user_path(user)
        end
      end
    end
  end
end
