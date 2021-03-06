class ApisController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index, :random, :about]

  def index
    @apis = if params[:search] && params[:search] != ""
              if !(Api.search(params[:search]).nil?)
                Api.search(params[:search])
              else
                []
              end
            else
              Api.all.order('created_at DESC')
            end
  end

  def random
    @api = Api.all.sample
    @review = Review.new
    @reviews = @api.reviews
    render :show
  end

  def about
    render :about
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

  def edit
    @api = Api.find(params[:id])
  end

  def update
    params[:api][:tags] = params[:api][:tags].split(',')
    @api = Api.find(params[:id])
    if @api.update(api_params)
      redirect_to api_path(@api)
      flash[:success] = "Api Updated!"
    else
      flash[:failure] = "Api Not Updated!"
      render :edit
    end
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
      flash[:failure] += ". API Not Created."
      render :new
    end
  end

  def destroy
    @api = Api.find(params[:id])
    @reviews = @api.reviews
    if @api.destroy
      @reviews.destroy
      flash[:success] = "Api has been deleted"
      redirect_to apis_path
    end
  end

  private

  def api_params
    params.require(:api).permit(
    :name, :url, :description, :paid, :tags, :category)
  end
end
