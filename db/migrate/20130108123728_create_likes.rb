class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :episode_id
      t.integer :no_of_like, :default => 0
      t.integer :no_of_unlike, :default => 0

      t.timestamps
    end
  end
end
