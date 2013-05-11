class CreateGeocamps < ActiveRecord::Migration
  def change
    create_table :geocamps do |t|
      t.integer :campaign_id
      t.text :states_called_now
      t.text :states_called_today
      t.text :states_included_all
      t.text :zipcodes_called_now
      t.text :zipcodes_called_today
      t.text :zipcodes_included_all

      t.timestamps
    end
  end
end
