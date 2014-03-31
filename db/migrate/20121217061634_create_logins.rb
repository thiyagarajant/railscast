class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :email
      t.integer :user_id
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
