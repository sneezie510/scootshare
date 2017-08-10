class ReservationsController < ApplicationController

  def index
    @owner = current_user
    @reservations = @owner.scooters.map{|scooter|scooter.reservations}.flatten

  end

  def approve
    @reservation = Reservation.find(params[:id])
    if current_user == @reservation.scooter.user
      @reservation.status = "approved"
      @reservation.save
      flash[:notice] = "Reservation has been approved."
    else
      flash[:alert] = "Status cannot be changed by this user."
    end
    redirect_to reservations_path
  end

  def deny
    @reservation = Reservation.find(params[:id])
    if current_user == @reservation.scooter.user
      @reservation.status = "denied"
      @reservation.save
      flash[:notice] = "Reservation has been denied."
    else
      flash[:alert] = "Status cannot be changed by this user."
    end
    redirect_to reservations_path
  end

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
