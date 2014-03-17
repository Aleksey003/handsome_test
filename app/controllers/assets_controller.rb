class AssetsController < ApplicationController
	
  before_action :authenticate_user!, :except => [:index]

  respond_to  :json
  
  def index
		if params[:hotel_id].nil?
  		@assets = Asset.all
  	else
  		@assets = Asset.where(hotel_id: params[:hotel_id])
  	end
  	respond_with (@assets.map{|asset| asset.to_jq_upload})
  end

  def create
  	@asset = Asset.new(asset_params)
	  @asset.save
	  render json: {files: [@asset.to_jq_upload], status: :created, location: @asset}
  end

  def destroy
  	@asset = Asset.find(params[:id])
  	@asset.destroy
    render json: {status: 200}
  end

  private
    def asset_params
      params.require(:asset).permit(:hotel_id, :photo)
    end
end
