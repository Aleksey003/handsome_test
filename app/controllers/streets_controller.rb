class StreetsController < ApplicationController
  before_action :set_street, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  respond_to :html

  def index
    @streets = Street.all
    respond_with @streets
  end

  def show
  end

  def new
    @street = Street.new
  end

  def edit
  end

  def create
    @street = Street.create(street_params)
    respond_with @street
  end

  def update
    @street.update(street_params)
    respond_with @street
  end

  def destroy
    @street.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_street
      @street = Street.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def street_params
      params.require(:street).permit(:title, :city_id)
    end
end
