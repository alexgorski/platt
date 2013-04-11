class MapsController < ApplicationController

  def show
  @restaurants  = Restaurant.all
  end

end