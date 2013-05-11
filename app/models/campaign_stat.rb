class CampaignStat < ActiveRecord::Base
  belongs_to :campaign
  
  attr_accessible :answeing_machine_calls_count_life, :answering_machine_calls_count_today, :call_picked_up_calls_count_life, 
  :call_picked_up_calls_count_today, :calls_in_progress, :campaign_id, :dialable_leads, :human_answered_calls_count_today, 
  :no_answer_calls_count_life, :no_answer_calls_count_today, :played_message_calls_count_life, :played_message_calls_count_today,
  :total_calls_made_count_life, :total_calls_made_count_today

end
