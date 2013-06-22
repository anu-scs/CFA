class CampaignStat < ActiveRecord::Base
  belongs_to :campaign
  
  attr_accessible :answeing_machine_calls_count_life, :answering_machine_calls_count_today, :call_picked_up_calls_count_life, 
  :call_picked_up_calls_count_today, :calls_in_progress, :campaign_id, :dialable_leads, :human_answered_calls_count_today, 
  :no_answer_calls_count_life, :no_answer_calls_count_today, :played_message_calls_count_life, :played_message_calls_count_today,
  :total_calls_made_count_life, :total_calls_made_count_today

  CALLS_IN_PROGRESS = "calls_in_progress"
  DIALABLE_LEADS = "dialable_leads"
  HUMAN_ANSWERED_CALLS_COUNT = "human_answered_calls_count"
  ANSWERING_MACHINE_CALLS_COUNT = "answering_machine_calls_count"
  PLAYED_MESSAGE_CALLS_COUNT = "played_message_calls_count"
  CALL_PICKED_UP_CALLS_COUNT = "call_picked_up_calls_count"
  NO_ANSWER_CALLS_COUNT = "no_answer_calls_count"
  TOTAL_CALLS_MADE_COUNT = "total_calls_made_count"
  AMOUNT_DONATIONS = "amount_donations"
  NUMBER_DONATIONS = "number_donations"
  TRANSFERRED_COUNT = "transferred_count"
  RECORDINGS_COUNT = "recordings_count"
  DONATIONS_SPENT = "donations_spent"
  DONATIONS_REMAINING = "donations_remaining"
  DAILY_SPENT_BUDGET = "daily_spent_budget"
  CALCULATED_CALLS_IN_PROGRESS = "calculated_calls_in_progress"
end
