class UpdateCampaignTable < ActiveRecord::Migration
  def up
		rename_column :campaigns, :active, :status
		remove_column :campaigns, :amount_donated_total
		add_column :campaigns, :auto_update_vici_calls_in_progress, :boolean
		add_column :campaigns, :call_for_1_line, :integer
		remove_column :campaigns, :number_donations_total
		remove_column :campaigns, :number_donations_today
		remove_column :campaigns, :amount_donations_today		
  end

  def down
		rename_column :campaigns, :status, :active
		add_column :campaigns, :amount_donated_total
		remove_column :campaigns, :auto_update_vici_calls_in_progress, :boolean
		remove_column :campaigns, :call_for_1_line, :integer
		add_column :campaigns, :number_donations_total
		add_column :campaigns, :number_donations_today
		add_column :campaigns, :amount_donations_today		
  end
end
