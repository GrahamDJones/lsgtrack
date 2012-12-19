class TimeEntry < ActiveRecord::Base
  attr_accessible :duration_minutes, :work_date, :ticket_id, :user, :duration
  belongs_to :ticket
  belongs_to :user

  validates :work_date, presence: { message: "Date can't be blank" }
  validates :ticket_id, presence: { message: "Ticket can't be blank" }
  validate :duration_must_be_present
  validate :user_must_be_present


  def duration=(str)
    self.duration_minutes = TimeSpent.new(str).to_i
  end

  def duration
    self.duration_minutes
  end

  def duration_hhmm
    TimeSpent.new(self.duration_minutes).hhmm
  end

  def to_s
    "#{self.work_date}:#{self.user.name}:#{self.duration}"
  end

  private

  def duration_must_be_present
    errors.add(:duration, "Duration can't be blank") if self.duration.blank? && self.duration_minutes.blank?
  end

  def user_must_be_present
    errors.add(:user, "User can't be blank") if self.user.blank?
  end

end
