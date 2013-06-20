class Campaign < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :category
  belongs_to :viciserver
  belongs_to :campaign_type
  
  has_one :campaign_stat, :dependent => :destroy
  has_many :campaign_stats_custom, :dependent => :destroy
  has_many :campaign_stats_geo, :dependent => :destroy
  has_many :donations, :dependent => :destroy
    
  has_many :campaign_images, :dependent => :destroy
  
  attr_accessible :active, :add_to_list_allow, :add_to_list_id, :add_to_list_position, :amount_donated_total, 
                  :amount_donations_today, :campaign_end_date_time, :campaign_start_date_time, :campaign_type_id, 
                  :category_id, :cost_per_call_minute, :description, :inflate_stats_percent, 
                  :internal_notes, :name, :number_donations_today, :number_donations_total, :public_stats_visible, 
                  :shortdescription, :transcript_text, :transcript_audio_file, :user_id, :vici_campaign_id, :viciserver_id,
                  :campaign_images_attributes
                  
  accepts_nested_attributes_for :campaign_images, :allow_destroy => true

  STATUS_ACTIVE = 2
  STATUS_PENDING = 1
  scope :active, where(status: STATUS_ACTIVE)
  scope :pending, where(status: STATUS_PENDING)

  def stats_custom_by_code(status_code, meth)
    stats_custom = campaign_stats_custom.where(status_code: status_code).first rescue nil
    return stats_custom.send(meth.to_sym) rescue 0
  end

  def get_interested_calls(stat_type)
    interested_calls = 0
    interested_calls = if stats_custom_by_code("SVYEXT",stat_type) > 0
        stats_custom_by_code("SVYEXT",stat_type)
      elsif stats_custom_by_code("SVYREC",stat_type) > 0
        stats_custom_by_code("SVYREC",stat_type)
      elsif stats_custom_by_code("SVYCLM",stat_type) > 0
        stats_custom_by_code("SVYCLM",stat_type)
      end
    return interested_calls
  end

  def self.get_campaigns_hash
    campaigns = Campaign.includes(:campaign_stat).active.limit 10
    campaign_list = campaigns.map{|campaign|
      { campaign_id: campaign.id,
        calls_forever: campaign.campaign_stat.total_calls_made_count_life || 0,
        calls_today: campaign.campaign_stat.total_calls_made_count_today || 0,
        calls_in_progress: campaign.campaign_stat.calculated_calls_in_progress || 0,
        total_donations: campaign.campaign_stat.amount_donaions_life || 0,
        calls_remaining: campaign.campaign_stat.dialable_leads || 0,
        calls_answered: campaign.stats_custom_by_code("PU","calls_today") || 0,
        calls_interested: campaign.get_interested_calls("calls_today") || 0,
        calls_transferred: campaign.campaign_stat.transferred_count_today || 0,
        calls_recorded: campaign.campaign_stat.recordings_count_today || 0,
        left_message: campaign.stats_custom_by_code("AL","calls_today") + campaign.stats_custom_by_code("AA","calls_today"),
        no_answer: campaign.campaign_stat.no_answer_calls_count_today || 0,
      }
    }
    return campaign_list
  end

  def self.search_pending_campaign(keyword)
    self.includes(:campaign_stat).pending.where("name LIKE ?", "%#{keyword}%").limit 10
  end

  def self.get_calls_stat_hash(campaign_id, status)
    calls_stat_list = []
    campaign = Campaign.includes(:campaign_stat).where(id: campaign_id.to_i).first
    calls_stat_list << if status == "today"
      { campaign_id: campaign.id,
        calls_remaining: campaign.campaign_stat.dialable_leads || 0,
        calls_answered: campaign.stats_custom_by_code("PU","calls_today") || 0,
        calls_interested: campaign.get_interested_calls("calls_today") || 0,
        calls_transferred: campaign.campaign_stat.transferred_count_today || 0,
        calls_recorded: campaign.campaign_stat.recordings_count_today || 0,
        left_message: campaign.stats_custom_by_code("AL","calls_today") + campaign.stats_custom_by_code("AA","calls_today"),
        no_answer: campaign.campaign_stat.no_answer_calls_count_today || 0,
      }
    elsif status == "forever"
      { campaign_id: campaign.id,
        calls_remaining: campaign.campaign_stat.dialable_leads || 0,
        calls_answered: campaign.stats_custom_by_code("PU","calls_life") || 0,
        calls_interested: campaign.get_interested_calls("calls_life") || 0,
        calls_transferred: campaign.campaign_stat.transferred_count_life || 0,
        calls_recorded: campaign.campaign_stat.recordings_count_life || 0,
        left_message: campaign.stats_custom_by_code("AL","calls_life") + campaign.stats_custom_by_code("AA","calls_life"),
        no_answer: campaign.campaign_stat.no_answer_calls_count_life || 0,
      }
    end
    return calls_stat_list
  end
end
