class AddColnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_price, :integer, :default => 0
  end
end
