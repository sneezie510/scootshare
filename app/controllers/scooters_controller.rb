class ScootersController < ApplicationController
  def index
    @scooters = Scooter.all
  end

  def create
    @scooter = Scooter.new(scooter_params)
    @scooter.user = @scooter
    @scooter.save
    if @scooter.save
      redirect_to account_path
    else
      render :new
  end

  def new
    @scooter = Scooter.new(scooter_params)
  end

  def show
    @scooter = Scooter.find(params[:id])
  end

  private

  def scooter_params
    params.require(:scooter).permit(:make, :model, :location, :availability, :picture, :user_id, :price)
  end



end
