class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.sort
    
  end
  def show  
    @restaurant = Restaurant.find(params[:id])
  end


end
