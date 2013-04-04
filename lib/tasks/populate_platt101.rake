task :insert_platt101 => :environment do
  @restaurants = File.readlines('./Data/masterlist.txt')
  @restaurants.each do |string|
    period = string.index(".")
    star = string.index('*')
    begin
      string = string.insert(period+1, ",")
      string = string.insert(star, ",")
    rescue
      next

    end
    array = string.split(',')
    @restaurant = Restaurant.new
    @restaurant.rank = array[0]
    @restaurant.name = array[1]
    @restaurant.stars = array[2]
    @restaurant.save
  end

end