class Admin::PermissionsController < ApplicationController
  before_filter :find_user

  def index
    @ability = Ability.new(@user)
    if @user.admin?
      @projects = []
    else
      @projects = Project.state_not_admin.page(params[:page]).per(10)
    end
  end

  def update
    params[:permissions].each do |id, permissions|
      project = Project.find(id)
      project.permissions.where(user_id: @user.id).each {|p| p.delete}
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
