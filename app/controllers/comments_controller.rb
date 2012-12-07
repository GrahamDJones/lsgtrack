class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_ticket

  def create
    params[:comment].delete(:state_id) unless current_user.admin? || can?(:"change ticket states", @ticket.project)
    @comment = @ticket.comments.build(params[:comment].merge(user: current_user))
    if @comment.save
      @ticket.tag!(params[:tags]) if current_user.admin? || can?(:tag, @ticket.project)
      redirect_to [@ticket.project, @ticket], notice: "Comment has been created."
    else
      flash[:alert] = "Comment has not been created."
      render template: "tickets/show"
    end
  end

  private
  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
    @project = @ticket.project
  end
end
