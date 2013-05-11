class CreateCampaignStats < ActiveRecord::Migration
  def change
    create_table :campaign_stats do |t|
      t.integer :campaign_id
      t.integer :calls_in_progress
      t.integer :dialable_leads
      t.integer :human_answered_calls_count_today
      t.integer :answering_machine_calls_count_today
      t.integer :played_message_calls_count_today
      t.integer :call_picked_up_calls_count_today
      t.integer :no_answer_calls_count_today
      t.integer :answeing_machine_calls_count_life
      t.integer :played_message_calls_count_life
      t.integer :call_picked_up_calls_count_life
      t.integer :no_answer_calls_count_life
      t.integer :total_calls_made_count_today
      t.integer :total_calls_made_count_life

      t.timestamps
    end
  end
end
