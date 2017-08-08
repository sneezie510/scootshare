class TripsController < ApplicationController
  def index
    @trips = current_user.reservations
  end

  # def cancel
  #   @trip.status = "cancelled"
  # end
end
