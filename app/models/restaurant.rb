class Restaurant < ActiveRecord::Base
  attr_accessible :name, :review, :city_id
  belongs_to :city


end
