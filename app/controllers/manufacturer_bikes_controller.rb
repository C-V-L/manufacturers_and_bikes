class ManufacturerBikesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end

  def new
  end
end