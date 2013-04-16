task :insert_platt101 => :environment do
  @restaurants = File.readlines('./data/masterlist.txt')
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
        :consumer_key => 'UCynPrJXZHFlZ3K0Hb_ZmA', 
        :consumer_secret => 'XJ3Jwa3ZaLWeS8Im33g8Hx8L3YQ', 
        :token => 'mcMxIBhNVRgf9LAXOwyyv3EXMbTxeoVa', 
        :token_secret => 'UCGGQ2iHztv0brGDN_1NgrCnQVo')
      response = client.search(request)
      r.yelp_id = response["businesses"][0]["id"]
      r.yelp_image_url = response["businesses"][0]["image_url"]
      r.yelp_url = response["businesses"][0]["url"]
      r.yelp_phone = response["businesses"][0]["phone"]
      r.yelp_display_phone = response["businesses"][0]["display_phone"]
      r.yelp_review_count = response["businesses"][0]["review_count"]
      r.yelp_categories = response["businesses"][0]["categories"]
      r.yelp_rating = response["businesses"][0]["rating"]
      r.yelp_rating_img_url = response["businesses"][0]["rating_img_url"]
      r.yelp_rating_img_url_small = response["businesses"][0]["rating_img_url_small"]
      r.yelp_rating_img_url_large = response["businesses"][0]["rating_img_url_large"]
      r.yelp_snippet_text = response["businesses"][0]["snippet_text"]
      r.yelp_location = response["businesses"][0]["location"]
      r.yelp_location_coordinate = response["businesses"][0]["location"]["coordinate"]
      r.yelp_location_coordinate_latitude = response["businesses"][0]["location"]["coordinate"]["latitude"]
      r.yelp_location_coordinate_longitude = response["businesses"][0]["location"]["coordinate"]["longitude"]
      r.yelp_location_address = response["businesses"][0]["location"]["address"][0]
      r.yelp_location_display_address = response["businesses"][0]["location"]["display_address"]
      r.yelp_location_city = response["businesses"][0]["location"]["city"]
      r.yelp_location_state_code = response["businesses"][0]["location"]["state_code"]
      r.yelp_location_postal_code = response["businesses"][0]["location"]["postal_code"]
      r.yelp_location_country_code = response["businesses"][0]["location"]["country_code"]
      r.yelp_location_cross_streets = response["businesses"][0]["location"]["cross_streets"]
      r.yelp_location_neighborhoods = response["businesses"][0]["location"]["neighborhoods"]
      r.yelp_location_geo_accuracy = response["businesses"][0]["location"]["geo_accuracy"]
      r.yelp_deals = response["businesses"][0]["yelp_deals"]
      r.save
    end
end

task :wash_hoods => :environment do
    
  @restaurants = Restaurant.all
  @restaurants.each do |r|
    begin
    r.yelp_location_neighborhoods = r.yelp_location_neighborhoods.gsub(/---\n- /, "")
    r.yelp_location_neighborhoods = r.yelp_location_neighborhoods.gsub(/\n/, "") 
    r.save
    rescue
      puts "couldnt gsub"
      next
    end  
  end
end

task :yipit => :environment do
  client = Yipit::Client.new('9fntGCDLgYPqZ8gq')

  @restaurants = Restaurant.all
  @restaurants.each do |r|
    begin
      yipit_num = r.yelp_phone
      yipit_num.insert(+6,'-')
      yipit_num.insert(+3,'-')
      url = client.deals(:phone => yipit_num)
      
      if url.empty?
        r.yipit_url = "No deals today"
      else
        r.yipit_url = url[0]["url"]
      end
      r.save
      rescue
       puts "No number."
        next
      end
    end
  end



