class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.string :note
      t.integer :category_id
      t.timestamps
    end
  end
end
