class CampaignsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @campaigns = Campaign.includes(:campaign_stat).all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign }
      format.js
    end
  end
  
  def new
    @campaign = Campaign.new
    @campaign.campaign_images.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campaign }
    end
  end

  # GET /vendors/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.build_campaign_stat
    @campaign.campaign_stats_customs.build
    respond_to do |format|
      if @campaign.save
        
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created and sent for review.' }
        format.json { render json: @campaign, status: :created, location: @campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vendors/1
  # PUT /vendors/1.json
  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated and sent for review.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.json { head :no_content }
    end
  end
end

