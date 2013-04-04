class RemoveReviewColumnFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :review
  end
end
