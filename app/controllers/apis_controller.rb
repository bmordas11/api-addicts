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
    @upvotes = Votes.where(user_vote: true, api: @api).count
    @downvotes = Votes.where(user_vote: false, api: @api).count
  end

  def create
    params[:api][:tags] = params[:api][:tags].split(',')
    api = Api.new(api_params)
    api.user = current_user

    if api.save
      Api.add_tags(api, params[:api][:tags])
      flash[:success] = "New API Created!"
      redirect_to api_path(api)
    else
      flash[:failure] = api.errors.full_messages.join(', ')
      flash[:failure] += ". API not created ya bum!"
      render :new
    end
  end

  private

  def api_params
    params.require(:api).permit(:name, :url, :description, :paid, :tags)
  end
end
