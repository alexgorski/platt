class Restaurant < ActiveRecord::Base
  attr_accessible :name, :nymag_page, :city_id, :yelp_id
  belongs_to :city

  has_many :reviews
  has_many :users, :through => :reviews, :dependent => :destroy
  
  accepts_nested_attributes_for :users
end
