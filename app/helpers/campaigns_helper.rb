module CampaignsHelper
  def total_destribution
    donation = @campaign.campaign_stat.amount_donations_life || 0
    answered = @campaign.stats_custom_by_code("PU","calls_life")
    no_answer = @campaign.campaign_stat.no_answer_calls_count_life || 0
    interested = @campaign.get_interested_calls("calls_life")
    left_msg_life = @campaign.stats_custom_by_code("AL","calls_life") + @campaign.stats_custom_by_code("AA","calls_life")
    transferred = @campaign.campaign_stat.transferred_count_life || 0
    opted_out = @campaign.stats_custom_by_code("NI","calls_life")
    recorded = @campaign.campaign_stat.recordings_count_life || 0
    
   return  answered + no_answer + interested + left_msg_life + transferred + opted_out + recorded
  end
  

  def answered_life(campaign)
    (campaign.stats_custom_by_code("PU","calls_life") / total_destribution.to_f) * 100 rescue 0
  end
  
  def no_answer_life(campaign)
    (campaign.campaign_stat.no_answer_calls_count_life  / total_destribution.to_f) * 100 rescue 0
  end

  def interested_life(campaign)
    (campaign.get_interested_calls("calls_life") / total_destribution.to_f) * 100 rescue 0
  end

  def left_msg_life_life(campaign)
    ((campaign.stats_custom_by_code("AL","calls_life") + campaign.stats_custom_by_code("AA","calls_life")) / total_destribution.to_f) * 100 rescue 0
  end

  def transferred_life(campaign)
    (campaign.campaign_stat.transferred_count_life / total_destribution.to_f) * 100 rescue 0
  end

  def opted_out_life(campaign)
    (campaign.stats_custom_by_code("NI","calls_life") / total_destribution.to_f) * 100 rescue 0
  end

  def recorded_life(campaign)
    (campaign.campaign_stat.recordings_count_life / total_destribution.to_f) * 100 rescue 0
  end
  
end
