class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(users_params)
    if @user.save
      flash[:komunikat] = 'Event został poprawnie stworzony.'
      # redirect_to
    else
      render :action => "new"
    end

  end

  def show
    @user = User.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def users_params
    params.require(:user).permit(:name, :last_name, :email, :age, :password, :password_confirmation, :tickets_number)
  end

end
