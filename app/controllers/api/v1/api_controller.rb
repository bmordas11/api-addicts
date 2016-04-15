module Api::V1
  class ApiController < ApplicationController
    # def change
    # @Apis = Api.where(category: params[:category])
    # render json: @Apis

    def change
      @apis = Api.where(category: params[:category])

      respond_to do |format|
        format.html { render partial: 'change', locals: { apis: @apis }}
        # format.js #auto-maps to preview.js.erb
        # format.js { render partial: 'change', locals: { apis: @apis }}
      end
    end
  end
end
