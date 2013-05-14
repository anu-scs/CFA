class Campaign < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :category
  belongs_to :viciserver
  belongs_to :campaign_type
  
  has_many :campaign_stats
  has_many :campaign_stats_customs
  has_many :geocamps
  has_many :campaign_images
  
  attr_accessible :active, :add_to_list_allow, :add_to_list_id, :add_to_list_position, :amount_donated_total, 
                  :amount_donations_today, :campaign_end_date_time, :campaign_start_date_time, :campaign_type_id, 
                  :category_id, :cost_per_call_minute, :description, :inflate_stats_percent, 
                  :internal_notes, :name, :number_donations_today, :number_donations_total, :public_stats_visible, 
                  :shortdescription, :transcript_text, :transcript_audio_file, :user_id, :vici_campaign_id, :viciserver_id,
                  :campaign_images_attributes
                  
  accepts_nested_attributes_for :campaign_images
end
