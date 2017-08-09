class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  # def approve
  # end

  # def deny

  # end

  def create
    # reservation = Reservation.create()
    if reservation.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def new
    @reservation = Reservation.new
  end

end
