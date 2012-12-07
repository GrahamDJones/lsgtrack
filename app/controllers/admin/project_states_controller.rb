class Admin::ProjectStatesController < Admin::BaseController

  before_filter :find_project_state, only: [:edit, :update, :make_default]

  def new
    @project_state = ProjectState.new
  end

  def create
    @project_state = ProjectState.new(params[:project_state])
    if @project_state.save
      redirect_to admin_project_states_path, notice: "Project State has been created."
    else
      flash[:alert] = "Project State has not been created."
      render action: "new"
    end
  end

  def edit
  end

  def update
    @project_state.update_attributes(params[:project_state])
    if @project_state.save
      redirect_to admin_project_states_path, notice: "Project State has been updated."
    else
      flash[:alert] = "Project State has not been updated."
      render :action => "edit"
    end
  end

  def make_default
    @project_state = ProjectState.find(params[:id])
    @project_state.default!
    redirect_to admin_project_states_path, notice: "#{@project_state.name} is now the default project state."
  end

  private

  def find_project_state
    @project_state = ProjectState.find(params[:id])
  end
end
