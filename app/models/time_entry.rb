class TimeEntry < ActiveRecord::Base
  attr_accessible :duration_minutes, :work_date, :ticket_id, :user, :duration
  belongs_to :ticket
  belongs_to :user

  def duration=(str)
    self.duration_minutes = TimeSpent.new(str).to_i
  end

  def duration
    self.duration_minutes
  end

end
