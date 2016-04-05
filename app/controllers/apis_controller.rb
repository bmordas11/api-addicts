class ApisController < ApplicationController
  def index
    @apis = Api.all
  end

  def new
    @api = Api.new
  end

  def show
    @the_api = Api.find(params[:id])
  end

  def create
    @api = Api.new(api_params)

    if @api.save
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
    params.require(:api).permit(:name, :url, :description, :paid)
  end
end
