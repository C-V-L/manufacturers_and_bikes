class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.sort_by_created_at
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @bike_count = @manufacturer.bike_count
  end

  def new
  end

  def create
    # manufacturer = Manufacturer.create(name: params[:name], employees: params[:employees], domestic: params[:domestic])
    manufacturer = Manufacturer.create(manufacturer_params)
    redirect_to "/manufacturers"
  end

  def manufacturer_params
    params.permit(:name, :employees, :domestic)
  end
end