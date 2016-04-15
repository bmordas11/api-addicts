module Api::V1
  class ApiController < ApplicationController

    def change
      apis = Api.where(category: params[:category])
      @apis = apis.paginate(page: params[:page], per_page: 1)

      respond_to do |format|
        format.html { render partial: 'change', locals: { apis: @apis }}
      end
    end
  end
end
