class RenameAnsweingToCampaignStats < ActiveRecord::Migration
  def up
    rename_column :campaign_stats, :answeing_machine_calls_count_life, :answering_machine_calls_count_life
  end

  def down
    rename_column :campaign_stats, :answering_machine_calls_count_life, :answeing_machine_calls_count_life
  end
end
