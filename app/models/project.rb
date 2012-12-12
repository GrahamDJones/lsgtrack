class Project < ActiveRecord::Base
  attr_accessible :name, :state_id

  validates :name, presence: true, uniqueness: true

  belongs_to :state
  has_many :tickets, dependent: :destroy, order: "created_at DESC"
  has_many :permissions, as: :thing
  has_many :time_entries, through: :tickets, dependent: :destroy

  scope :readable_by, lambda { |user|
    joins(:permissions).where(permissions: {action: "view", user_id: user.id})
  }

  scope :state_not_admin, joins(:state).where(states: {is_admin_only: false})

  before_create :set_default_state

  def self.for(user)
    user.admin? ? Project.order(:name) : Project.state_not_admin.readable_by(user).order(:name)
  end

  def last_ticket
    tickets.last
  end

  private

  def set_default_state
    self.state = ProjectState.find_by_default(true)
  end

end
