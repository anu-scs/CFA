class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.string :shortdescription
      t.integer :user_id
      t.integer :category_id
      t.integer :viciserver_id
      t.boolean :active
      t.integer :campaign_type_id
      t.text :internal_notes
      t.string :vici_campaign_id
      t.integer :add_to_list_id
      t.string :add_to_list_position
      t.boolean :add_to_list_allow
      t.text :teanscript_text
      t.string :transcript_audio_file
      t.datetime :campaign_start_date_time
      t.datetime :campaign_end_date_time
      t.boolean :public_stats_visible
      t.float :amount_donated_total
      t.integer :number_donations_total
      t.integer :number_donations_today
      t.float :amount_donations_today
      t.float :inflate_stats_percent
      t.float :cost_per_call_minute

      t.timestamps
    end
  end
end
