
class Subscription < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_type, :name, :ip_address,:user_id,:card_number, 
                  :card_verification, :email, :plan_id, :card_month, :stripe_card_token, :stripe_customer_token
  attr_accessor :card_number, :card_verification, :card_month, :stripe_card_token

  has_many :transactions, :class_name => "SubscribeTransaction"
  belongs_to :user
  belongs_to :plan

  # validates :name, :presence => true
  # validates :email, :presence => true

  #validate :validate_card
  


  attr_accessor :stripe_card_token

  def save_with_payment(c, v)
    @c = c
    @v = v
    if valid?
#raise Stripe::Customer.create(description: email, plan: plan_id, card: credit_card ).inspect
      customer = Stripe::Customer.create(email: email, description: "new customer", plan: plan_id, card: credit_card)
      self.stripe_customer_token = customer.id
      save!
    end

    charge = Stripe::Charge.create(
    :amount => 2000, # amount in cents, again
    :currency => "usd",
    :card => credit_card,
    :description => "something about your customer"
    
  )
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def credit_card
    self.stripe_customer_token = {
      :type               => card_type,
      :number             => @c,
      :verification_value => @v,
      :exp_month              => card_expires_on.month.to_i,
      :exp_year               => card_expires_on.year.to_i,
      :first_name         => name,
      :last_name          => "J"
      
    }
  end
  # def user_info
  #   self.stripe_customer_token = {
  #       :name     => "Ryan Bates",
  #       :address_line1 => "123 Main St.",
  #       :address_city     => "New York",
  #       :address_state    => "NY",
  #       :address_country  => "US",
  #       :address_zip      => "10001"
  #   }
  # end
  # token = "stripeToken"

  
#raise charge.inspect
  
=begin


  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    user.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end
  
  def price_in_cents
    (user.total_price + 1 * 50).round
  end

  private
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        raise "Error: #{message}"
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => "4475240091657809",
      :verification_value => "123",
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => "thiyagu ",
      :last_name          => "T"
      
    )
  end
=end
end
