class AddRankStarsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :rank, :string
    add_column :restaurants, :stars, :string
  end
end
