class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(users_params)
    if @user.save
      log_in @user
      flash[:komunikat] = 'Zarejestrowałeś się poprawnie!'
      redirect_to @user
    else
      render :action => "new"
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def users_params
    params.require(:user).permit(:name, :last_name, :email, :age, :password, :password_confirmation, :tickets_number)
  end

end
