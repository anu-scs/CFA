namespace :campaign_update do
  task :update_campaign_global => :environment do
    puts "update campaign_stats stat_code"
    
    %w[human_answered_calls_count  answering_machine_calls_count played_message_calls_count call_picked_up_calls_count no_answer_calls_count no_answer_calls_count total_calls_made_count amount_donations transferred_count recordings_count amount_donations ].each do |stat_code|
      puts "==========update #{stat_code.gsub("_", " ")}=========="
      campaign_global = CampaignGlobal.where(stat_code: ("CampaignStat::"+stat_code.upcase).constantize).first
      unless campaign_global.blank?
        campaign_global.value_today = CampaignStat.sum((stat_code+'_today').to_sym)
        campaign_global.value_life =  CampaignStat.sum((stat_code+'_life').to_sym)
        campaign_global.save
      end
    end

    %w[ donations_spent  donations_remaining daily_spent_budget calculated_calls_in_progress calls_in_progress dialable_leads ].each do |stat_code|
      puts "==========update #{stat_code.gsub("_", " ")}=========="
      campaign_global = CampaignGlobal.where(stat_code: ("CampaignStat::"+stat_code.upcase).constantize).first
      unless campaign_global.blank?
        campaign_global.value_today = CampaignStat.sum((stat_code).to_sym)
        campaign_global.value_life = CampaignStat.sum((stat_code).to_sym)
        campaign_global.save
      end
    end

    puts "update campaign_stats_custom stat_code"
    
    %w[HR_CUSTOMER HR_AGENT HR_NOANSWER AL SVYEXT PU NA AA AB B PM SVYREC SVYCLM SVYHU SVYVM XFER DNC].each do |stat_code|
      campaign_global = CampaignGlobal.where(stat_code: ("CampaignStatsCustom::"+stat_code).constantize).first
      unless campaign_global.blank?
        campaign_global.value_today = CampaignStatsCustom.sum(:calls_today).where(status_code: stat_code)
        campaign_global.value_life = CampaignStatsCustom.sum(:calls_life).where(status_code: stat_code)
        campaign_global.save
      end
    end
  end
end
