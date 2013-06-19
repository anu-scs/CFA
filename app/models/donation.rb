class Donation < ActiveRecord::Base
  attr_accessible :amount, :express_token, :ip_address, :user_id, :express_payer_id, :first_name, :last_name, :email, :purchased_at
  belongs_to :user
  
  def self.make_order(token, user, ip_address)
    order = self.new
    order.express_token = token
    order.ip_address = ip_address
    order.user = user
    order.save!
    return order
  end
  
  def express_token=(token)
    self[:express_token] = token
    if new_record? and !token.blank?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
      self.email = details.params["payer"]
      self.amount = details.params["order_total"]
      self.purchased_at = Time.now
    end
  end
  
end
