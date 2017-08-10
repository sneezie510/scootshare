class TripsController < ApplicationController
  def index
    @trips = current_user.reservations
  end

  def cancel
    @trip = Reservation.find(params[:id])
    if current_user == @trip.user
      @trip.status = "cancelled"
      @trip.save
      flash[:notice] = "Your reservation has been cancelled."
    else
      flash[:alert] = "Status cannot be changed by this user."
    end
    redirect_to trips_path
  end


end
