class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  # def approve
  # end

  # def deny

  # end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @scooter = Scooter.find(params[:scooter_id])
    @reservation.scooter = @scooter
    @reservation.total_price = ((@reservation.end_date - @reservation.start_date).to_i + 1) * @scooter.price
    @reservation.status = "pending"
    if @reservation.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def new
    @scooter = Scooter.find(params[:scooter_id])
    @reservation = Reservation.new
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)

  end

end
