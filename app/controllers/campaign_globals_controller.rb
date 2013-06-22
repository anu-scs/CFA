class CampaignGlobalsController < ApplicationController

  def get_total_calls_forever
    total_calls_forever = CampaignGlobal.where(stat_code: CampaignStat::TOTAL_CALLS_MADE_COUNT).first rescue 0
    render :text => total_calls_forever.try(:value_life) || 0
  end

  def get_total_calls_today
    total_calls_today = CampaignGlobal.where(stat_code: CampaignStat::TOTAL_CALLS_MADE_COUNT).first rescue 0
    render :text => total_calls_today.try(:value_today) || 0
  end

  def get_donation_remaining
    donation_remaining = CampaignGlobal.where(stat_code: CampaignStat::DONATIONS_REMAINING).first rescue 0
    render :text => donation_remaining.try(:value_life) || 0
  end

  def get_calls_in_progress
    calls_in_progress = CampaignGlobal.where(stat_code: CampaignStat::CALLS_IN_PROGRESS).first rescue 0
    render :text => calls_in_progress.try(:value_life) || 0
  end

end
