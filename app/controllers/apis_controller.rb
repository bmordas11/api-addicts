class ApisController < ApplicationController
  APIS_PER_PAGE = 5
  def index
    apis = Api.all.order(created_at: :desc)
    @apis = apis.paginate(page: params[:page], :per_page => 5)
  end

  def new
    @api = Api.new
  end

  def show
    @api = Api.find(params[:id])
    @review = Review.new
    @reviews = @api.reviews
  end

  def create
    params[:api][:tags] = params[:api][:tags].split(',')
    api = Api.new(api_params)
    api.user = current_user

    if api.save
      params[:api][:tags].each do |tag|
        new_tag = Tag.new(name: "#{tag}")
        new_tag.save
        new_join = ApiTag.new(api: api, tag: new_tag)
        new_join.save
      end
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
