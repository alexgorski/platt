class AddTweetsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :tweets_num, :integer
    add_column :restaurants, :tweets_last_id, :bigint
  end
end
