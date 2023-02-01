class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    
  end
end