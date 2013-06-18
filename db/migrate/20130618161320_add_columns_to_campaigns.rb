class AddColumnsToCampaigns < ActiveRecord::Migration
  def change
		add_column :campaigns, :daily_budget_days, :integer
		add_column :campaigns, :am_transcript_text, :text
		add_column :campaigns, :am_audio_file, :text
  end
end
