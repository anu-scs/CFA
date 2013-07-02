class CreateCampaignAttributes < ActiveRecord::Migration
  def change
    create_table :campaign_attributes do |t|
      t.integer :campaign_id
      t.integer :eo_region_selected
      t.string :eo_region_type
      t.string :eo_region_data
      t.integer :agent_selected
      t.integer :agent_app
      t.integer :agent_invite
      t.integer :record_selected
      t.integer :record_time
      t.string :record_email
      t.integer :record_web
      t.string :callwho_states
      t.string :callwho_counties
      t.string :callwho_cities
      t.string :callwho_areacodes
      t.string :callwho_list
      t.timestamps
    end
  end
end
