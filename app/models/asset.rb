class Asset < ActiveRecord::Base
  attr_accessible :asset
  belongs_to :ticket
  has_attached_file :asset
end
