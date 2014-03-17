class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  respond_to :html
  def index
    @countries = Country.all
    respond_with @country
  end

  def new
    @country = Country.new
    respond_with @country
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.create(country_params)
    respond_with @country
  end

  def update
    @country.update(country_params)
    respond_with @country
  end

  def destroy
    @country.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:title)
    end
end
