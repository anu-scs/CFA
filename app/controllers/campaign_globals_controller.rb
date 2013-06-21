class CampaignGlobalsController < ApplicationController

  def get_total_calls_forever
    total_calls_forever = CampaignGlobal.where(stat_code: "Donations_remaining").first rescue 0
    render :text => total_calls_forever || 0
  end

  def get_total_calls_today
    total_calls_today = CampaignGlobal.where(stat_code: "Donations_remaining").first rescue 0
    render :text => total_calls_today || 0
  end

  def get_donation_remaining
    donation_remaining = CampaignGlobal.where(stat_code: "Donations_remaining").first rescue 0
    render :text => donation_remaining || 0
  end

  def get_calls_in_progress
    calls_in_progress = CampaignGlobal.where(stat_code: "Calls_in_progress").first rescue 0
    render :text => calls_in_progress || 0
  end

end
