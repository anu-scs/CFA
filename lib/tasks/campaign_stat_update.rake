namespace :campaign do
  task :update_campaign_stat => :environment do
    puts "update campaign_stats table"
    Campaign.joins(:campaign_stat).each do |campaign|
      cmpn_stat = campaign.campaign_stat
      donations_remaining = ((cmpn_stat.total_calls_made_count_life.to_f * campaign.cost_per_call_minute.to_f) - cmpn_stat.amount_donations_life.to_f).ceil
      daily_spent_budget = (cmpn_stat.amount_donations_life / campaign.daily_budget_days).ceil rescue 0
      donations_spent = (cmpn_stat.total_calls_made_count_life.to_f * campaign.cost_per_call_minute.to_f).ceil
      calculated_calls_in_progress = ((( daily_spent_budget / campaign.cost_per_call_minute) / campaign.calls_for_1_line)).ceil rescue 0 
      # ASSIGN CALCULATED RECORDS
      cmpn_stat.donations_remaining = donations_remaining
      cmpn_stat.daily_spent_budget = daily_spent_budget
      cmpn_stat.donations_spent = donations_spent
      cmpn_stat.calculated_calls_in_progress = calculated_calls_in_progress
      cmpn_stat.save
    end
  end
end
 
