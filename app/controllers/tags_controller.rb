class TagsController < ApplicationController

  def remove
    @ticket = Ticket.find(params[:ticket_id])
    if current_user.admin? || can?(:tag, @ticket.project)
      @tag = Tag.find(params[:id])
      @ticket.tags -= [@tag]
      @ticket.save!
    end
  end
end
