class TimeEntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project

  def new
    @time_entry = @project.time_entries.build
  end

  def create
    @time_entry = @project.time_entries.build(params[:time_entry].merge!(user: current_user))
    if @time_entry.save
      redirect_to [@project, @time_entry.ticket], notice: "Time Entry has been created."
    else
      flash[:alert] = "Time Entry has not been created."
      render action: :new
    end
  end

  private

  def find_project
    @project = Project.for(current_user).find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "The project you were looking for could not be found."
  end

end
