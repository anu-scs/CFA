class Donation < ActiveRecord::Base
  attr_accessible :amount, :express_token, :ip_address, :user_id, :express_payer_id, :first_name, :last_name, :email, :purchased_at
  
  def self.make_order(token, user, ip_address)
    order = self.new
    order.express_token = token
    order.ip_address = ip_address
    order.user = user
    order.amount = total
    order.save!
    order.purchase
    return order
  end
  
  def express_token=(token)
    self[:express_token] = token
    if new_record? and !token.blank?
    details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params[:first_name]
      self.last_name = details.params[:last_name]
      self.email = details.params[:email]
    end
  end
  
  
  def purchase
    response = process_purchase
    self.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end
   
private
 
  def process_purchase
    unless express_token.blank?
    EXPRESS_GATEWAY.purchase(total, express_purchase_options)
    end
  end
 
  def express_purchase_options
    {
    ip: ip_address,
    token: express_token,
    payer_id: express_payer_id
    }
  end
end
