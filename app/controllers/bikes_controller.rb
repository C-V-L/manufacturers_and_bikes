class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to "/bikes/#{@bike.id}"
  end

  private
  def bike_params
    params.permit(:name, :wheelsize, :carbon)
  end
end