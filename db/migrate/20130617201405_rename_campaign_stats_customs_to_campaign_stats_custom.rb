class RenameCampaignStatsCustomsToCampaignStatsCustom < ActiveRecord::Migration
  def change
		rename_table :campaign_stats_customs, :campaign_stats_custom
  end
  
end
