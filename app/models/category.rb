class Category < ActiveRecord::Base
  attr_accessible :description, :name, :parent_category_id, :short_description
  has_many :campaigns
end
