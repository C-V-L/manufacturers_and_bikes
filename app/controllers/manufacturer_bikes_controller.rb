class ManufacturerBikesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @bikes = @manufacturer.bikes
    if params[:sort] == "alphabetically"
      @bikes = @manufacturer.bikes.sort_alphabetically
    elsif params["Minimum_wheel_size"] != nil
      @bikes = @manufacturer.bikes.filter_by_wheelsize(params["Minimum_wheel_size"])
    end
  end

  def new
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end

  def create
    manufacturer = Manufacturer.find(params[:manufacturer_id])
    bike = manufacturer.bikes.create!(bike_params)
    redirect_to "/manufacturers/#{manufacturer.id}/bikes"
  end

  private
  def bike_params
    params.permit(:name, :wheelsize, :carbon)
  end
end