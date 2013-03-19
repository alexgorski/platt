class City < ActiveRecord::Base
  attr_accessible :name, :user_id, :restaurants_attributes
  belongs_to :user
  has_many :restaurants
  accepts_nested_attributes_for :restaurants
end
