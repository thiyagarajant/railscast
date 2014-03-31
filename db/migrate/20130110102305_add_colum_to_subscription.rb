class AddColumToSubscription < ActiveRecord::Migration
  def up
  	add_column :subscriptions, :name, :string
  	add_column :subscriptions, :email, :string
    add_column :subscriptions, :stripe_card_token, :string
    add_column :subscriptions, :stripe_customer_token, :string
    add_column :subscriptions, :plan_id, :integer
  	remove_column :subscriptions, :first_name
  	remove_column :subscriptions, :last_name
  end
  def down
  	add_column :subscriptions, :first_name, :string
  	add_column :subscriptions, :last_name, :string
  	remove_column :subscriptions, :name
    remove_column :subscriptions, :stripe_card_token
    remove_column :subscriptions, :stripe_customer_token
    remove_column :subscriptions, :plan_id
  	remove_column :subscriptions, :email
  end
end
