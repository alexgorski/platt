class CitiesController < ApplicationController
  def new
    @city = City.new
    File.read('./app/assets/masterlist.txt').each_line do |line|
     @city.restaurants.build(:name => line.chop)
   end


     #101.times { @city.restaurants.build(:name => File) }
  end
  
  def create
    #@city = City.new(params[:city])
    @user = current_user
    @user.cities.build(params[:city])
    
    #if @user.cities(params[:city])
    @user.save
    redirect_to cities_path, notice: "New city added"
  end
  
  def index
    @cities = City.all
  end
end
