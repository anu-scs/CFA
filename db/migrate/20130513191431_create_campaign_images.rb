class CreateCampaignImages < ActiveRecord::Migration
  def change
    create_table :campaign_images do |t|
      t.string :campimage
      t.integer :campaign_id
      t.string :image_name

      t.timestamps
    end
  end
end
