class Project < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, uniqueness: true
  has_many :tickets, dependent: :destroy, order: "created_at DESC"
  has_many :permissions, as: :thing
  scope :readable_by, lambda { |user|
    joins(:permissions).where(permissions: {action: "view", user_id: user.id})
  }

  def self.for(user)
    user.admin? ? Project.order(:name) : Project.readable_by(user).order(:name)
  end

  def last_ticket
    tickets.last
  end
end
