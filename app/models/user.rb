class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :cities_attributes
  validates_uniqueness_of :email
  has_many :cities
  accepts_nested_attributes_for :cities
end
