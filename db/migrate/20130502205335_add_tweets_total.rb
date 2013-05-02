class AddTweetsTotal < ActiveRecord::Migration
  def change
  add_column :restaurants, :tweets_total, :bigint

  end

end
