class RenameAmountDonaionsLifeInCampaignStats < ActiveRecord::Migration
  def up
    rename_column :campaign_stats, :amount_donaions_life, :amount_donations_life 
  end

  def down
    rename_column :campaign_stats, :amount_donations_life, :amount_donaions_life 
  end
end
