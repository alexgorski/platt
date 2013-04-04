class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.date :date_dined 
      t.text :comments
      t.integer :user_id
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
