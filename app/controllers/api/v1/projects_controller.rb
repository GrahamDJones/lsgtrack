class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    respond_with(Project.for(current_user).order(:name))
  end
end