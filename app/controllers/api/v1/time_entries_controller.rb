class Api::V1::TimeEntriesController < Api::V1::BaseController

  def create
    if params[:time_entry]
      time_entry = TimeEntry.create(params[:time_entry].merge(user: current_user))
    else
      time_entry = TimeEntry.create
    end
    if time_entry.valid?
      respond_with(time_entry, location: api_v1_time_entry_path(time_entry))
    else
      respond_with(time_entry)
    end
  end

end