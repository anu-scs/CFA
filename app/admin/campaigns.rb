ActiveAdmin.register Campaign do
   form(:html => { :multipart => true }) do |f|
    f.inputs "Campaign" do
      f.input :user_id, :label => 'Creator', :as => :select, :collection => User.all.map{|u| ["#{u.lastname}, #{u.firstname}", u.id]}
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|u| ["#{u.name}", u.id]}
      f.input :viciserver_id, :label => 'Viciserver', :as => :select, :collection => Viciserver.all.map{|u| ["#{u.name}", u.id]}
      f.input :campaign_type_id, :label => 'Campaign Type', :as => :select, :collection => CampaignType.all.map{|u| ["#{u.name}", u.id]}
      f.input :active, :as => :boolean
      f.input :name
      f.input :add_to_list_allow
      f.input :add_to_list_id
      f.input :add_to_list_position
      f.input :amount_donated_total
      f.input :amount_donations_today
      f.input :campaign_end_date_time
      f.input :campaign_start_date_time
      f.input :cost_per_call_minute
      f.input :description
      f.input :inflate_stats_percent 
      f.input :internal_notes
      f.input :number_donations_today
      f.input :number_donations_total
      f.input :public_stats_visible 
      f.input :shortdescription
      f.input :transcript_text
      f.input :transcript_audio_file
      f.input :vici_campaign_id
      if campaign.campaign_images
        campaign.campaign_images.each do |x|
          f.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image', :hint => f.template.image_tag(x.campimage.url(:thumb))
        end
      end
      f.has_many :campaign_images do |p|
        # i.input :campimage, :as => :file
        p.input :campimage, :as => :file, :label => "Image" #,:hint => p.template.image_tag(p.object.campimage.url(:thumb)) 
      end
    end
    f.buttons
  end
end
