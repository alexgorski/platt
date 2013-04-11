class MapsController < ApplicationController

  def show
    if current_user
    @restaurants  = Restaurant.all
    @reviews = Review.where(:user_id => current_user.id)
    else
    redirect_to new_user_path
    end
  end

end