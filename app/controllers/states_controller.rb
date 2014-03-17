class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  respond_to :html
  def index
    @states = State.all
    respond_with @states
  end

  def show
  end

  def new
    @state = State.new
    respond_with @state
  end

  def edit
  end

  def create
    @state = State.create(state_params)
    respond_with @state
  end

  def update
    @state.update(state_params)
    respond_with @state
  end

  def destroy
    @state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.require(:state).permit(:title, :country_id)
    end
end
