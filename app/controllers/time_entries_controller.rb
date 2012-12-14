class TimeEntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project

  def new
    if params[:ticket_id]
      #@ticket = Ticket.find(params[:ticket_id])
      @time_entry = @ticket.time_entries.build
    else
      @time_entry = @project.time_entries.build
    end
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

  def index
    @time_entries = @ticket.time_entries.order("work_date desc")
  end

  def edit
    @time_entry = TimeEntry.find(params[:id])
    @ticket = @time_entry.ticket
    @project = @ticket.project
  end

  def update
    @time_entry = TimeEntry.find(params[:id])
    @ticket = @time_entry.ticket
    @project = @ticket.project
    if @time_entry.update_attributes(params[:time_entry])
      @ticket = @time_entry.ticket
      redirect_to ticket_time_entries_path(@ticket), notice: "Time Entry has been updated."
    else
      flash[:alert] = "Time Entry has not been updated."
      render action: :edit
    end
  end

  def destroy
    @time_entry = TimeEntry.find(params[:id])
    @ticket = @time_entry.ticket
    @project = @ticket.project
    @time_entry.destroy
    redirect_to ticket_time_entries_path(@ticket), notice: "Time Entry has been deleted."
  end

  private

  def find_project
    if params[:ticket_id]
      @ticket = Ticket.find(params[:ticket_id])
      @project = @ticket.project
    elsif params[:project_id]
      @project = Project.for(current_user).find(params[:project_id])
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "The project you were looking for could not be found."
  end

end
