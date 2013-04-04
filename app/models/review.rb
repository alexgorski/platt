class Review < ActiveRecord::Base
  attr_accessible :date_dined, :comments, :user_id, :restaurant_id
  belongs_to :restaurant
  belongs_to :user

  validates :restaurant_id, :presence => true
  validates :user_id, :presence => true

  def self.comments(user_id, restaurant_id)
    Review.where(:user_id => user_id, :restaurant_id => restaurant_id).first_or_create(:comments => "Add Comments!")
  end

end
