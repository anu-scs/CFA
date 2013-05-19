class CampaignType < ActiveRecord::Base
  attr_accessible :description, :name, :short_description
  has_many :campaigns
end
