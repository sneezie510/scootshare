class ScootersController < ApplicationController

  def index
    @scooters = Scooter.where.not(latitude: nil, longitude: nil)
    session[:date_data] = params if params[:start_date]
    @hash = Gmaps4rails.build_markers(@scooters) do |scooter, marker|
      marker.lat scooter.latitude
      marker.lng scooter.longitude
      marker.infowindow render_to_string(partial: "/shared/map_box", locals: { scooter: scooter })
    end
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(scooter_params)
    @scooter.user = current_user
    @scooter.save
    if @scooter.save
      redirect_to account_path
    else
      render :new
    end
  end

  def show
    @scooter = Scooter.find(params[:id])
    if data = session[:date_data]
      @start_date = Date.parse(data["start_date"])
      @end_date = Date.parse(data["end_date"])
    else
      @start_date = Date.today
      @end_date = Date.today
    end
    @total_price = ((@end_date - @start_date).to_i + 1) * @scooter.price
    @reservation = Reservation.new
    @hash = Gmaps4rails.build_markers(@scooter) do |scooter, marker|
      marker.lat scooter.latitude
      marker.lng scooter.longitude
    end
  end

  def edit
    @scooter = Scooter.find(params[:id])
  end

  def update
    @scooter = Scooter.find(params[:id])
    @scooter.update(scooter_params)
    if @scooter.save
      redirect_to account_path
    else
      render :update
    end
  end

  private

  # def set_user
  #   @user = current_user
  # end

  def scooter_params
    params.require(:scooter).permit(:make, :model, :location, :price, :picture, :photo, :photo_cache, :availability, :user_id)
  end
end
