class CreateCampaignTypes < ActiveRecord::Migration
  def change
    create_table :campaign_types do |t|
      t.string :name
      t.string :short_description
      t.text :description

      t.timestamps
    end
  end
end
