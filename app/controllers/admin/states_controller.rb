class Admin::StatesController < Admin::BaseController

  before_filter :find_state, only: [:edit, :update, :make_default]

  def new
    @state = State.new
  end

  def create
    @state = State.new(params[:state])
    if @state.save
      redirect_to admin_states_path, notice: "State has been created."
    else
      flash[:alert] = "State has not been created."
      render action: "new"
    end
  end

  def edit
  end

  def update
    @state.update_attributes(params[:state])
    if @state.save
      redirect_to admin_states_path, notice: "State has been updated."
    else
      flash[:alert] = "State has not been updated."
      render :action => "edit"
    end
  end

  def make_default
    @state = State.find(params[:id])
    @state.default!
    redirect_to admin_states_path, notice: "#{@state.name} is now the default state."
  end

  private

  def find_state
    @state = State.find(params[:id])
  end
end
