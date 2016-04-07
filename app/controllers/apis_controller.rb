class ApisController < ApplicationController
  def index
    @apis = Api.all
  end

  def new
    @api = Api.new
  end

  def show
    @api = Api.find(params[:id])
  end

  def create
    params[:api][:tags] = params[:api][:tags].split(',')
    @api = Api.new(api_params)
    if @api.save
      params[:api][:tags].each do |tag|
        new_tag = Tag.new(name: "#{tag}")
        new_tag.save
        new_join = Apitag.new(api: @api, tag: new_tag)
        new_join.save
      end
      flash[:success] = "New API Created!"
      redirect_to api_path(@api)
    else
      flash[:error] = @api.errors.full_messages.join(', ')
      flash[:error] += ". API not created ya bum!"
      render :new
    end
  end

  private

  def api_params
    params.require(:api).permit(:name, :url, :description, :paid, :tags)
  end
end
