class AddColumnToEpisodes < ActiveRecord::Migration
  def change
  	add_attachment :episodes, :picture
  	add_attachment :episodes, :video
  end
end
