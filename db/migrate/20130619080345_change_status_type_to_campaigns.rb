class ChangeStatusTypeToCampaigns < ActiveRecord::Migration
  def up
    change_column :campaigns, :status, :integer
  end

  def down
    change_column :campaigns, :status, :boolean
  end
end
