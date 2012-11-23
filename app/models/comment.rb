class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  attr_accessible :text, :user, :ticket
  validates :text, presence: true

end
