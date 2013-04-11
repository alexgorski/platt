class RestaurantsController < ApplicationController

  def index
    if current_user
    @restaurants = Restaurant.all.sort
    else
      redirect_to new_user_path
    end
  end
  def show  
    @restaurant = Restaurant.find(params[:id])
  end


end
