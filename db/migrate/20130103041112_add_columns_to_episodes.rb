class AddColumnsToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :avg_rating, :float
  end
end
