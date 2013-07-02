class CreateCampaignMenus < ActiveRecord::Migration
  def change
    create_table :campaign_menus do |t|
      t.integer :campaign_id
      t.integer :menu_num
      t.string :menu_name
      t.string :menu_transcript
      t.string :menu_option1
      t.string :menu_option2
      t.string :menu_option3
      t.string :menu_option4
      t.string :menu_option5
      t.string :menu_option6
      t.string :menu_option7
      t.string :menu_option8
      t.string :menu_option9
      t.string :menu_option10
      t.string :menu_option11
      t.string :menu_option12
      t.string :menu_option13
      t.string :menu_option14
      t.string :menu_option15
      t.timestamps
    end
  end
end
