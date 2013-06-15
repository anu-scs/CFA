class AddHumanAnsweredCallsCountLifeToCampaignStats < ActiveRecord::Migration
  def change
	add_column :campaign_stats, :human_answered_calls_count_life, :integer
	add_column :campaign_stats, :amount_donaions_life, :float
	add_column :campaign_stats, :number_donations_life, :float
	add_column :campaign_stats, :number_donations_today, :float
	add_column :campaign_stats, :amount_donations_today, :float
	add_column :campaign_stats, :donations_spent, :float
	add_column :campaign_stats, :donations_remaining, :float
	add_column :campaign_stats, :daily_spent_budget, :float
	add_column :campaign_stats, :calculated_calls_in_progress, :integer
	add_column :campaign_stats, :recording_count, :integer
  end
end
