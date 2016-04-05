class ApisController < ApplicationController
  def index
    @apis = Api.all
    # @apis = Api.order_by(created_at: :desc).limit(10)
  end

  def show
    @the_api = Api.find(params[:id])
  end

  def create
    @new_api = Api.new(api_params)

    if @new_api.save
      flash[:success] = "New API Created!"
      redirect_to api_path(@new_api)
    else
      flash[:error] = @new_api.errors.full_messages.join(', ')
      flash[:error] += ". API not created ya bum!"
      render :new
    end

    # if @new_api.save
    #   render json: { fortunes: @new_api },
    #     status: :created,
    #     location: api_fortune_url(@new_api)
    # else
    #   render json: @new_api.errors,
    #     status: :unprocessable_entity
    # end
  end

  # def update
    # @fortune = Fortune.find(params[:id])
    #
    # if @fortune.save
    #   render json: { fortunes: @fortune },
    #     status: :created,
    #     location: api_fortune_url(@fortune)
    # else
    #   render json: @fortune.errors,
    #     status: :unprocessable_entity
    # end
  # end

  # def destroy
    # @fortune = Fortune.find(params[:id])
    # @fortune.destroy
  # end

  private
  def api_params
    params.require(:new_api).permit(:name, :url, :description, :paid)
  end
end
