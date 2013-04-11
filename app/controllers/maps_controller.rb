class MapsController < ApplicationController

  def show
  @restaurants  = Restaurant.all
  @reviews = Review.where(:user_id => current_user.id)
  end

end