class ReservationsController < ApplicationController

  def index
  end

  def approve
  end

  def deny

  end

  def create
    raise
  end

  def new
    @reservation = Reservation.new
    @scooter = Scooter.find(params[:scooter_id])
  end

end
