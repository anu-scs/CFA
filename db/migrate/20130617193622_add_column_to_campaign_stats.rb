class AddColumnToCampaignStats < ActiveRecord::Migration
  def change
		add_column :campaign_stats, :transferred_count_today, :integer
		add_column :campaign_stats, :transferred_count_life, :integer
		add_column :campaign_stats, :recordings_count_life, :integer
		rename_column :campaign_stats, :recording_count, :recordings_count_today
  end
end
