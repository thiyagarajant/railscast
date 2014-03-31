class AddColumnToSubscribetransactions < ActiveRecord::Migration
  def change
    add_column :subscribe_transactions, :response, :string
  end
end
