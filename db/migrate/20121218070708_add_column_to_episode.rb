class AddColumnToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :view_name, :string
  end
end
