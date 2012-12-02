class Comment < ActiveRecord::Base
  before_create :set_previous_state
  after_create :set_ticket_state, :creator_watches_ticket

  belongs_to :ticket
  delegate :project, to: :ticket
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, class_name: "State"

  attr_accessible :text, :user, :ticket, :state_id
  validates :text, presence: true

  private

  def set_ticket_state
    if self.state
      self.ticket.state = self.state
      self.ticket.save!
    end
  end

  def set_previous_state
    self.previous_state = ticket.state
  end

  def creator_watches_ticket
    ticket.watchers << user unless ticket.watchers.exists?(email: user.email )
  end

end
