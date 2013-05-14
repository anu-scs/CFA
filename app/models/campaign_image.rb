class CampaignImage < ActiveRecord::Base
  attr_accessible :campaign_id, :campimage, :image_name, :remote_capimage_url
  belongs_to :campaign
  mount_uploader :campimage, CampaignUploader
end
