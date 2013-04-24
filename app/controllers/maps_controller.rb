class MapsController < ApplicationController

  def show
    if current_user
    @restaurants  = Restaurant.all
    @reviews = Review.where(:user_id => current_user.id)
    @green_markers = Restaurant.visited(current_user)
    @blue_markers = Restaurant.not_visited(current_user)
    else
    redirect_to new_user_path
    end
  end

end