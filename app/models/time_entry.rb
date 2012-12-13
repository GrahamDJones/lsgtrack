class TimeEntry < ActiveRecord::Base
  attr_accessible :duration_minutes, :work_date, :ticket_id, :user, :duration
  belongs_to :ticket
  belongs_to :user

  def duration=(str)
    self.duration_minutes = if str.include?(':')
                         a = str.split(':')
                         a[0].to_i * 60 + a[1].to_i
                       elsif str.include?('.')
                         (str.to_f * 60).to_i
                       else
                         str.to_i
                       end unless str.blank?
  end
  def duration
    self.duration_minutes
  end

end
