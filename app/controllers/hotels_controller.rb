class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  respond_to :html

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
    respond_with(@hotel, @comment, @comments)
  end

  def new
    @hotel = Hotel.new
  end

  def edit
  end

  def create
    @hotel = Hotel.create(hotel_params)
    respond_with @hotel
  end

  def update
    @hotel.update(hotel_params)
    respond_with @hotel
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
