class AddColsToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :episode_type, :integer, :default => 0
  end
end
