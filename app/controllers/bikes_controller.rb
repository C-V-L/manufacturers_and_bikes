class BikesController < ApplicationController
  def index
    if params[:filter] == "by_carbon"
      @bikes = Bike.filter_for_carbon
    else
      @bikes = Bike.all
    end
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
  
  def destroy
    bike = Bike.find(params[:id])
    bike.destroy
    redirect_to "/bikes"
  end

  private
  def bike_params
    params.permit(:name, :wheelsize, :carbon)
  end
end