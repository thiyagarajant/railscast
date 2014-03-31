class SubscribeTransaction < ActiveRecord::Base
  attr_accessible :action, :amount, :authorization, :message, :params, :subscription_id, :success, :response


  belongs_to :subscription
  serialize :params
  
  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
    
  end
end
