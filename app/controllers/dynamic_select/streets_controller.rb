module DynamicSelect  
  class StreetsController < ApplicationController
    respond_to :json
    def index
      @streets = Street.where(city_id: params[:city_id])
      respond_with (@streets)
    end

  end
end
