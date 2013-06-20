class HomeController < ApplicationController
  def index
    @campaigns = Campaign.includes(:campaign_stat).active.limit 10
    @pending_campaigns = Campaign.includes(:campaign_stat).pending.limit 10
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
