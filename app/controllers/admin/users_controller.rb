class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    admin = params[:user].delete("admin") == "1"
    @user = User.new(params[:user])
    @user.admin = admin
    if @user.save
      redirect_to admin_users_path, notice: "User has been created."
    else
      flash[:alert] = "User has not been created."
      render action: :new
    end
  end
end
