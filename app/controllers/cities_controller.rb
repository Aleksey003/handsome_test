class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  respond_to :html

  def index
    @cities = City.all
    respond_with @cities
  end

  def show
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.create(city_params)
    respond_with @city
  end

  def update
    @city.update(city_params)
    respond_with @city
  end

  def destroy
    @city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:title, :state_id)
    end
end
