class Restaurant < ActiveRecord::Base
  attr_accessible :name, :nymag_page, :city_id, :yelp_id, :yelp_image_url, :yelp_url, :yelp_phone, :yelp_display_phone, :yelp_review_count, :yelp_categories, :yelp_rating, :yelp_rating_img_url, :yelp_rating_img_url_small, :yelp_rating_img_url_large, :yelp_snippet_text,:yelp_location,:yelp_location_coordinate,:yelp_location_coordinate_latitude,:yelp_location_coordinate_longitude,:yelp_location_address,:yelp_location_display_address,:yelp_location_city, :yelp_location_state_code, :yelp_location_postal_code, :yelp_location_country_code, :yelp_location_cross_streets, :yelp_location_neighborhoods, :yelp_location_geo_accuracy, :yelp_deals, :yipit_url, :old_rank
  belongs_to :city

  has_many :reviews
  has_many :users, :through => :reviews, :dependent => :destroy
  
  accepts_nested_attributes_for :users

  def self.visited(current_user)
    been_to = current_user.reviews.collect {|rvw| rvw.restaurant_id if rvw.date_dined != nil}.delete_if{|i| i == nil}
    Restaurant.find(been_to)
  end

  def self.not_visited(current_user)
    been_to = current_user.reviews.collect {|rvw| rvw.restaurant_id if rvw.date_dined == nil}.delete_if{|i| i == nil}
    Restaurant.find(been_to)
  end


  
end

