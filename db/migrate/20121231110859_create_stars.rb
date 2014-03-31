class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.float :rating
      t.integer :episode_id
      t.integer :user_id
      t.float :average_rating

      t.timestamps
    end
  end
end
