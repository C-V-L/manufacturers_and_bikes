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
    manufacturer = Manufacturer.create(name: params[:name], employees: params[:employees], domestic: params[:domestic])
    redirect_to "/manufacturers/#{manufacturer.id}"
  end
end