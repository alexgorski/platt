class AddNymagColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :nymag_page, :string
  end
end
