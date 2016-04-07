class ApisController < ApplicationController
  def index
    @apis = Api.all
  end

  def new
    @api = Api.new
  end

  def show
    @api = Api.find(params[:id])
    @review = Review.new
    @reviews = @api.reviews
    # @reviews = Reviews.find(params[:id])
  end

  def create
    @api = Api.new(api_params)
    @api.user = User.find(session["warden.user.user.key"][0][0])
    if @api.save
      flash[:success] = "New API Created!"
      redirect_to api_path(@api)
    else
      flash[:failure] = @api.errors.full_messages.join(', ')
      flash[:failure] += ". API not created ya bum!"
      render :new
    end
  end

  private

  def api_params
    params.require(:api).permit(:name, :url, :description, :paid)
  end
end
