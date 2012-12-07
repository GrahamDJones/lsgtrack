class ApplicationController < ActionController::Base
  before_filter :find_states
  protect_from_forgery

  private

  def authorize_admin!
    authenticate_user!
    redirect_to root_path, alert: "You must be an admin to do that." unless current_user.admin?
  end

  def find_states
    @ticket_states = TicketState.all
    @project_states = ProjectState.all
  end
end
