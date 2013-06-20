class Donation < ActiveRecord::Base

  belongs_to :user
  belongs_to :campaign
  
  after_create :update_campaign_stats, :update_campaign_global
  
  def self.make_order(token, user, ip_address, campaign_id = nil)
    order = self.new
    order.express_token = token
    order.ip_address = ip_address
    order.user = user
    order.campaign_id = campaign_id
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
  
  private
  
  def update_campaign_stats
    campaign_stat = self.try(:campaign).try(:campaign_stat)
    if campaign_stat.present?
      campaign_stat.update_attributes( number_donations_life: campaign_stat.number_donations_life+1, 
                                      amount_donations_life: campaign_stat.amount_donations_life + self.amount,
                                      number_donations_today: campaign_stat.number_donations_today + 1,
                                      amount_donations_today: campaign_stat.amount_donations_today + self.amount
                                      )
    end
  end
  
  def update_campaign_global
   # campaign_stat.update_attributes( number_donations_life: campaign_stat.number_donations_life +1, 
   #                                 amount_donations_life: campaign_stat.number_donations_life + self.amount,
   #                                 number_donations_today: campaign_stat.number_donations_today + 1,
   #                                 amount_donations_today: campaign_stat.amount_donations_today + self.amount
   #                                   )    
  end
  
end
