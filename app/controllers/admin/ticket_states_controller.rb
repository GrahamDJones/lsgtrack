class Admin::TicketStatesController < Admin::BaseController

  before_filter :find_ticket_state, only: [:edit, :update, :make_default]

  def new
    @ticket_state = TicketState.new
  end

  def create
    @ticket_state = TicketState.new(params[:ticket_state])
    if @ticket_state.save
      redirect_to admin_ticket_states_path, notice: "Ticket State has been created."
    else
      flash[:alert] = "Ticket State has not been created."
      render action: "new"
    end
  end

  def edit
  end

  def update
    @ticket_state.update_attributes(params[:ticket_state])
    if @ticket_state.save
      redirect_to admin_ticket_states_path, notice: "Ticket State has been updated."
    else
      flash[:alert] = "Ticket State has not been updated."
      render :action => "edit"
    end
  end

  def make_default
    @ticket_state = TicketState.find(params[:id])
    @ticket_state.default!
    redirect_to admin_ticket_states_path, notice: "#{@ticket_state.name} is now the default ticket state."
  end

  private

  def find_ticket_state
    @ticket_state = TicketState.find(params[:id])
  end
end
