class CreateCampaignGlobals < ActiveRecord::Migration
def change
		create_table :campaign_globals do |t|
			t.string :stat_code
			t.integer :value_today
			t.integer :value_life
			t.timestamps
		end
  end
end
