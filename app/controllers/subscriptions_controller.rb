class SubscriptionsController < ApplicationController

  def index
  end

  def new
  	# plan = plan.find(params[:plan_id])
  	# @subscription = plan.subscription.build
  	@subscription = Subscription.new
  end

  # def create
  #   card = params[:subscription][:card_number]
  #   verify = params[:subscription][:card_verification]

  # @subscription = Subscription.new(params[:subscription])
  # if @subscription.save_with_payment(card, verify)
  #   current_user.update_attributes(:purchased_at => Time.now)
  #   redirect_to episodes_path, :notice => "Thank you for subscribing!"
  # else
  #   raise @subscription.errors.inspect
  #   render :new
  # end
  #end
  def create
    ActiveMerchant::Billing::Base.mode = :test
    gateway = ActiveMerchant::Billing::PaypalGateway.new(
        :login    => 'thiyagu.changepond-facilitator_api1.gmail.com',
        :password => '1374493558',
        :signature => 'AiPC9BjkCyDFQXbSkoZcgqH3hpacAImoUjk1P9STZr1GxBvY-WFDl6PX'
      )

    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number     => params[:subscription][:card_number],
      :month      => params[:subscription]["card_expires_on(2i)" ],
      :year       => params[:subscription]["card_expires_on(1i)" ],
      :first_name => "Thiaygu",
      :last_name  => 'raja',
      :verification_value  => 123,
      :type               => "visa"
    )

    if credit_card.valid?
      # Create a gateway object to the TrustCommerce service
      # Authorize for $10 dollars (1000 cents)
      response = gateway.authorize(100, credit_card, :ip => "127.0.0.1")

        if response.success?
          gateway.capture(100, response.authorization)
          User.find(current_user.id).update_attributes(:purchased_at =>Time.now)
          redirect_to episode_path(params[:id])
        else
          raise "Error: #{response.message}"
        end
    else
      raise "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
    end
  end


end
