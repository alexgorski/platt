class FixYelpStringsToText < ActiveRecord::Migration
  def change
    change_column :restaurants, :yelp_snippet_text, :text
    change_column :restaurants, :yelp_location_display_address, :text
    change_column :restaurants, :yelp_categories, :text
  end
end
