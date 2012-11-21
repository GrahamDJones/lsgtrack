class Admin::UsersController < Admin::BaseController
  before_filter :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    admin = get_admin
    @user = User.new(params[:user])
    @user.admin = admin
    if @user.save
      redirect_to admin_users_path, notice: "User has been created."
    else
      flash[:alert] = "User has not been created."
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user.admin = get_admin
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to admin_users_path, notice: "User has been updated."
    else
      flash[:alert] = "User has not been updated."
      render action: :edit
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = "You cannot delete yourself!"
    else
      @user.destroy
      flash[:notice] = "User has been deleted."
    end
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def get_admin
    params[:user].delete(:admin) == "1"
  end
end
