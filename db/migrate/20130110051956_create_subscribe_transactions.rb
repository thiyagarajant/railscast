class CreateSubscribeTransactions < ActiveRecord::Migration
  def change
    create_table :subscribe_transactions do |t|
      t.integer :subscription_id
      t.string :action
      t.integer :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps
    end
  end
end
