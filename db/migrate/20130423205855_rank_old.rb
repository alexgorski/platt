class RankOld < ActiveRecord::Migration
  def change
    add_column :restaurants, :rank_old, :string
  end
end
