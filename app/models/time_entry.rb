class TimeEntry < ActiveRecord::Base
  attr_accessible :duration_minutes, :work_date, :ticket_id, :user
  belongs_to :ticket
  belongs_to :user
end
