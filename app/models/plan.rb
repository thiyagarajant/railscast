class Plan < ActiveRecord::Base
  attr_accessible :description, :name, :price
  has_one :subscription
  after_update :create_stripe_plan


def create_stripe_plan
  Stripe::Plan.create(
	  :amount => price.to_i,
	  :interval => 'month',
	  :name => name,
	  :currency => 'usd',
	  :id => id
	)
end


end
