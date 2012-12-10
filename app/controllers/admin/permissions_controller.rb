class Admin::PermissionsController < ApplicationController
  before_filter :find_user

  def index
    @ability = Ability.new(@user)
    if @user.admin?
      @projects = []
    else
      @projects = Project.all
      #@projects = Project.state_not_admin
    end
  end

  def update
    @user.permissions.clear
    params[:permissions].each do |id, permissions|
      project = Project.find(id)
      permissions.each do |permission, checked|
        Permission.create!(user: @user, thing: project, action: permission)
      end
    end
    redirect_to admin_user_permissions_path, notice: "Permissions updated."
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
