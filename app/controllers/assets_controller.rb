class AssetsController < ApplicationController
	def index
		if params[:hotel_id].nil?
  		@assets = Asset.all
  	else
  		@assets = Asset.where(hotel_id: params[:hotel_id])
  	end
  	respond_to do |format|
  		format.html
  		format.json {render json: @assets.map{|asset| asset.to_jq_upload}}
  	end
  end

  def show
  	@asset = Asset.find(params[:id])
  	respond_to do |format|
 			format.html
  		format.json {render json: @asset}
  	end
  end

  def new
  	@asset = Asset.new
  	respond_to do |format|
  		format.html
  		format.json {render json: @asset}
  	end
  end

  def edit
  	@asset = Asset.find(params[:id])
  end

  def create
  	@asset = Asset.new(asset_params)
  	respond_to do |format|
	  	if @asset.save
	  		format.html {
	  			render json: [@asset.to_jq_upload].to_json,
	  				content_type: 'text/html',
	  				layout: false
	  			}
	  		format.json {render json: {files: [@asset.to_jq_upload]}, status: :created, location: @asset}
	  	else
	  		format.html {render action: 'new'}	
	 			format.json {render json: @asset.errors, status: :unprocessable_entity}
	  	end
  	end
  end


  def update
  	@asset = Asset.find(params[:id])
  	respond_to do |format|
  		if @asset.update_attributes(params[:asset])
  			format.html
  			format.json
  		else
  			format.html { render action: "edit"}
  			format.json {render json: @asset.errors, status: :unprocessable_entity}
  		end
  	end
  end

  def destroy
  	@asset = Asset.find(params[:id])
  	@asset.destroy
  	respond_to do |format|
  		format.html {redirect_to assets_url}
  		format.json {head :no_content}
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:hotel_id, :photo)
    end
end
