class AddYelpAttributes < ActiveRecord::Migration
  def change
    add_column :restaurants, :yelp_image_url, :string
    add_column :restaurants, :yelp_url, :string
    add_column :restaurants, :yelp_phone, :string
    add_column :restaurants, :yelp_display_phone, :string
    add_column :restaurants, :yelp_review_count, :string
    add_column :restaurants, :yelp_categories, :string
    add_column :restaurants, :yelp_rating, :string
    add_column :restaurants, :yelp_rating_img_url, :string
    add_column :restaurants, :yelp_rating_img_url_small, :string
    add_column :restaurants, :yelp_rating_img_url_large, :string
    add_column :restaurants, :yelp_snippet_text, :string
    add_column :restaurants, :yelp_location, :string
    add_column :restaurants, :yelp_location_coordinate, :string
    add_column :restaurants, :yelp_location_coordinate_latitude, :string
    add_column :restaurants, :yelp_location_coordinate_longitude, :string
    add_column :restaurants, :yelp_location_address, :string
    add_column :restaurants, :yelp_location_display_address, :string
    add_column :restaurants, :yelp_location_city, :string
    add_column :restaurants, :yelp_location_state_code, :string
    add_column :restaurants, :yelp_location_postal_code, :string
    add_column :restaurants, :yelp_location_country_code, :string
    add_column :restaurants, :yelp_location_cross_streets, :string
    add_column :restaurants, :yelp_location_neighborhoods, :string
    add_column :restaurants, :yelp_location_geo_accuracy, :string
    add_column :restaurants, :yelp_deals, :string

  end
end
