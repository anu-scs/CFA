class CampaignStatsGeo < ActiveRecord::Base
  self.table_name = "campaign_stats_geo"
  belongs_to :campaign
  
  attr_accessible :states_called_now, :states_called_today, :states_included_all, :zipcodes_called_now, 
  :zipcodes_called_today, :zipcodes_included_all, :campaign_id
end
