class AddDataCalculationToCampaignGlobals < ActiveRecord::Migration
  def change
		add_column :campaign_globals, :data_calculation, :integer
  end
end
