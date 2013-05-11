class CampaignStatsCustom < ActiveRecord::Base
  belongs_to :campaign
  
  attr_accessible :calls_life, :calls_today, :campaign_id, :status_code
end
