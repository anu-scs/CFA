class DonationsController < ApplicationController
  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase((params[:donation][:amount].to_f * 100),
      ip: request.remote_ip,
      return_url: url_for(:action => 'new', :only_path => false),
      cancel_return_url: url_for(:action => 'index', :controller => 'home', :only_path => false),
      locale: I18n.locale.to_s.sub(/-/, '_') #you can put 'en' if you don't know what it means :)
      # allow_guest_checkout: 'true',   #payment with credit card for non PayPal users
    )

    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
  def new
    @order = Donation.new(express_token: params[:token])
  end
  
  def create
    @order = Donation.make_order(params[:token], current_user, request.remote_ip)
    respond_to do |format|
      format.html { redirect_to(order_path(@order.id), notice: "Thank yo for your donation.") }
    end
  end
  
end
