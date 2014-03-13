class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    if params[:top]
      @hotels = Hotel.limit_top_rating(params[:top])
    else
      @hotels = Hotel.all
    end
    respond_with @hotels
  end

  def show
    @hotel = Hotel.find(params[:id])
    @comment = @hotel.comments.new
    @comments = @hotel.comments
    respond_with(@hotel, @comment, @comments)
  end

  def new
    @hotel = Hotel.new
  end

  def edit
  end

  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotels_path, notice: 'Hotel was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotels_path, notice: 'Hotel was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @hotel.destroy
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:title, :room_description, :price_for_room, :breakfast_included, :country_id, :state_id, :city_id, :street_id)
    end
end
