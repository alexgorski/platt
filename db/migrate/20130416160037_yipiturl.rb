class Yipiturl < ActiveRecord::Migration
  def change
  	add_column :restaurants, :yipit_url, :string
  end
end
