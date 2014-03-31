class AddColumnsEpisodes < ActiveRecord::Migration
  def change
  	add_column :episodes, :view_count, :integer, :default => 0
  end
end
