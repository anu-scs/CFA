class CreateCampaignStatsCustoms < ActiveRecord::Migration
  def change
    create_table :campaign_stats_customs do |t|
      t.string :status_code
      t.integer :calls_today
      t.integer :calls_life
      t.integer :campaign_id

      t.timestamps
    end
  end
end
