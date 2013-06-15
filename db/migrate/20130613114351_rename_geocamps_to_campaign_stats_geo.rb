class RenameGeocampsToCampaignStatsGeo < ActiveRecord::Migration
  def up
		rename_table :geocamps, :campaign_stats_geo
		add_column :campaign_stats_geo, :stat_code, :string
		add_column :campaign_stats_geo, :stat_value, :string
		add_column :campaign_stats_geo, :calls_life, :integer
		add_column :campaign_stats_geo, :call_today, :integer
		add_column :campaign_stats_geo, :list_count, :integer
		add_column :campaign_stats_geo, :calls_in_progress, :integer
		add_column :campaign_stats_geo, :vici_campaign_id, :string
		remove_column :campaign_stats_geo, :states_called_now
		remove_column :campaign_stats_geo, :states_called_today
		remove_column :campaign_stats_geo, :states_included_all
		remove_column :campaign_stats_geo, :zipcodes_called_now
		remove_column :campaign_stats_geo, :zipcodes_called_today
		remove_column :campaign_stats_geo, :zipcodes_included_all
  end

  def down
		rename_table :campaign_stats_geo, :geocamps
		remove_column :campaign_stats_geo, :stat_code, :string
		remove_column :campaign_stats_geo, :stat_value, :string
		remove_column :campaign_stats_geo, :calls_life, :integer
		remove_column :campaign_stats_geo, :call_today, :integer
		remove_column :campaign_stats_geo, :list_count, :integer
		remove_column :campaign_stats_geo, :calls_in_progress, :integer
		remove_column:campaign_stats_geo, :vici_campaign_id, :string
		add_column :campaign_stats_geo, :states_called_now
		add_column :campaign_stats_geo, :states_called_today
		add_column :campaign_stats_geo, :states_included_all
		add_column :campaign_stats_geo, :zipcodes_called_now
		add_column :campaign_stats_geo, :zipcodes_called_today
		add_column :campaign_stats_geo, :zipcodes_included_all
  end
end
