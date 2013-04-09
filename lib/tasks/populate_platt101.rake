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
    @restaurant.name = array[1].lstrip!
    @restaurant.stars = array[2]
    @restaurant.nymag_page = array[1].gsub(" ", '-').downcase
    @restaurant.save
  end
end

task :insert_yelpid => :environment do
    @restaurants = Restaurant.all
    client = Yelp::Client.new
    @restaurants.each do |r|
      request = Yelp::V2::Search::Request::Location.new(
        :term => r.name, 
        :city => 'New York', 
        :state => 'NY',
        :limit => '1',
        :consumer_key => '', 
        :consumer_secret => '', 
        :token => '', 
        :token_secret => '')
      response = client.search(request)
      r.yelp_id = response["businesses"][0]["id"]
      r.save
    end
end
