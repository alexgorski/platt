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
    #raise params.inspect
    if @user.cities.find_by_name(params[:city][:name])
      redirect_to edit_city_path, notice: "City Exists"
    else
    @user.cities.build(params[:city])
    
    
    #if @user.cities(params[:city])
    @user.save
    redirect_to cities_path, notice: "New city added"
    end
  end
  
  def edit
  end
  
  def index
    @cities = City.all
  end
end
