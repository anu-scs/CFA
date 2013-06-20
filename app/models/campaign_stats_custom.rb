class CampaignStatsCustom < ActiveRecord::Base
	self.table_name = "campaign_stats_custom"
  belongs_to :campaign
  
  attr_accessible :calls_life, :calls_today, :campaign_id, :status_code
end
