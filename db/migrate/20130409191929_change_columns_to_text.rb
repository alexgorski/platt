class ChangeColumnsToText < ActiveRecord::Migration
  def change

    change_column :restaurants, :yelp_image_url, :text
    change_column :restaurants, :yelp_url, :text
    change_column :restaurants, :yelp_phone, :text
    change_column :restaurants, :yelp_display_phone, :text
    change_column :restaurants, :yelp_review_count, :text
    change_column :restaurants, :yelp_rating, :text
    change_column :restaurants, :yelp_rating_img_url, :text
    change_column :restaurants, :yelp_rating_img_url_small, :text
    change_column :restaurants, :yelp_rating_img_url_large, :text
    change_column :restaurants, :yelp_location, :text
    change_column :restaurants, :yelp_location_coordinate, :text
    change_column :restaurants, :yelp_location_coordinate_latitude, :text
    change_column :restaurants, :yelp_location_coordinate_longitude, :text
    change_column :restaurants, :yelp_location_address, :text
    change_column :restaurants, :yelp_location_city, :text
    change_column :restaurants, :yelp_location_state_code, :text
    change_column :restaurants, :yelp_location_postal_code, :text
    change_column :restaurants, :yelp_location_country_code, :text
    change_column :restaurants, :yelp_location_cross_streets, :text
    change_column :restaurants, :yelp_location_neighborhoods, :text
    change_column :restaurants, :yelp_location_geo_accuracy, :text
    change_column :restaurants, :yelp_deals, :text

  end

end
