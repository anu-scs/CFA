class DonationsController < ApplicationController

  before_filter :valid_campaign, only: [:express_checkout]

  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase((params[:donation][:amount].to_f * 100),
      ip: request.remote_ip,
      return_url: url_for(:action => 'has_donated', :campaign_id => params[:campaign_id], :only_path => false),
      cancel_return_url: url_for(:action => 'index', :controller => 'home', :only_path => false),
      locale: I18n.locale.to_s.sub(/-/, '_')
    )
    if response.success?
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    else
      falsh[:notice] = "Something is wrong with your payment detail."
    end
  end
  
  def new
    @order = Donation.new(express_token: params[:token])
  end
  
  def has_donated
    @order = Donation.make_order(params[:token], current_user, request.remote_ip, params[:campaign_id] )
    respond_to do |format|
      format.html { 
        flash[:notice] = "This is basic feature more is comming."
        redirect_to :root
      }
    end
  end
  
  private
  
  def valid_campaign
    unless Campaign.where(id: params[:campaign_id]).first
      falsh[:notice] = "Something is wrong with your payment detail."
      redirect_to root_path
    end
  end

end
