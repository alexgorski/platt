# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130502205335) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "city_id"
    t.string   "rank"
    t.string   "stars"
    t.string   "nymag_page"
    t.string   "yelp_id"
    t.text     "yelp_image_url"
    t.text     "yelp_url"
    t.text     "yelp_phone"
    t.text     "yelp_display_phone"
    t.text     "yelp_review_count"
    t.text     "yelp_categories"
    t.text     "yelp_rating"
    t.text     "yelp_rating_img_url"
    t.text     "yelp_rating_img_url_small"
    t.text     "yelp_rating_img_url_large"
    t.text     "yelp_snippet_text"
    t.text     "yelp_location"
    t.text     "yelp_location_coordinate"
    t.text     "yelp_location_coordinate_latitude"
    t.text     "yelp_location_coordinate_longitude"
    t.text     "yelp_location_address"
    t.text     "yelp_location_display_address"
    t.text     "yelp_location_city"
    t.text     "yelp_location_state_code"
    t.text     "yelp_location_postal_code"
    t.text     "yelp_location_country_code"
    t.text     "yelp_location_cross_streets"
    t.text     "yelp_location_neighborhoods"
    t.text     "yelp_location_geo_accuracy"
    t.text     "yelp_deals"
    t.string   "yipit_url"
    t.string   "rank_old"
    t.integer  "tweets_num"
    t.integer  "tweets_last_id",                     :limit => 8
    t.integer  "tweets_total",                       :limit => 8
  end

  create_table "reviews", :force => true do |t|
    t.date     "date_dined"
    t.text     "comments"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
