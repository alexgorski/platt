class MapsController < ApplicationController

  def show
  @restaurants  = Restaurants.all
  end

end