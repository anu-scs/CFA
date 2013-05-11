class Viciserver < ActiveRecord::Base
  attr_accessible :db_connection_string, :description, :name, :server_ip
  has_many :campaigns
end
