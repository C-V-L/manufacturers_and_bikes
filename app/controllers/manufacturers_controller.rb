class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.sort_by_created_at
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @bike_count = @manufacturer.bike_count
  end
end