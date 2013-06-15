class CreateCampaignRecordings < ActiveRecord::Migration
def change
		create_table :campaign_recordings do |t|
			t.integer :campaign_id
			t.integer :vici_campaign_id
			t.integer :lead_id
			t.integer :unique_id
			t.string :source
			t.integer :viciserver_id
			t.string :file_name
			t.string :vici_file_location
			t.string :vici_full_url
			t.string :duration
			t.string :status
			t.integer :rep_id
			t.string :rep_name
			t.string :rep_phone_number
			t.boolean :approved
			t.boolean :featured
			t.string :phone_number
			
			t.timestamps
		end
  end

end
