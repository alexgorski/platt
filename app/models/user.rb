class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :cities_attributes
  
  validates_uniqueness_of :email
  has_many :reviews
  has_many :restaurants, :through => :reviews, :dependent => :destroy
  
  accepts_nested_attributes_for :restaurants
end
