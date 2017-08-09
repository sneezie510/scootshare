class ScootersController < ApplicationController
  def index
    @scooters = Scooter.all
    session[:date_data] = params if params[:start_date]
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
  end

    def new
      @scooter = Scooter.new(scooter_params)
    end

    def show
      @scooter = Scooter.find(params[:id])
      if data = session[:date_data]
        @start_date = Date.parse(data["start_date"])
        @end_date = Date.parse(data["end_date"])
        @total_price = ((@end_date - @start_date).to_i + 1) * @scooter.price
      end
      @reservation = Reservation.new
    end

    private

    def scooter_params
      params.require(:scooter).permit(:make, :model, :location, :availability, :picture, :user_id, :price)
    end
  end
