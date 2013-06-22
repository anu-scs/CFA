class AddDescToCampaignGlobals < ActiveRecord::Migration
  def change
    add_column :campaign_globals, :desc, :string
  end
end
