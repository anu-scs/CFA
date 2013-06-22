task :initialize_global => :environment do
  const_global = %w[CALLS_IN_PROGRESS DIALABLE_LEADS HUMAN_ANSWERED_CALLS_COUNT ANSWERING_MACHINE_CALLS_COUNT PLAYED_MESSAGE_CALLS_COUNT CALL_PICKED_UP_CALLS_COUNT NO_ANSWER_CALLS_COUNT TOTAL_CALLS_MADE_COUNT AMOUNT_DONATIONS NUMBER_DONATIONS TRANSFERRED_COUNT RECORDINGS_COUNT DONATIONS_SPENT DONATIONS_REMAINING DAILY_SPENT_BUDGET CALCULATED_CALLS_IN_PROGRESS]
  const_custom = %w[HR_CUSTOMER HR_AGENT HR_NOANSWER AL SVYEXT PU NA AA AB B PM SVYREC SVYCLM SVYHU SVYVM XFER DNC]
  CampaignGlobal.delete_all

  const_global.each do |const|
   campaign_global = CampaignGlobal.new
   campaign_global.stat_code = "CampaignStat::#{const}".constantize 
   campaign_global.save!
  end

  const_custom.each do |const|
   campaign_global = CampaignGlobal.new
   campaign_global.stat_code = "CampaignStatsCustom::#{const}".constantize 
   campaign_global.save!
  end
end
