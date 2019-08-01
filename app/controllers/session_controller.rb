class SessionController < ApplicationController
  skip_before_action :require_login, only: [:new,:create]
  def index

  end

  def new
    @user = User.new
  end

  def create
    # if @user = User.where(user_name: parameter[:user_name]).first
    #   if @user.password == parameter[:password]
    if @user = User.authenticate(parameter)
      session[:current_user_id] = @user.id
      current_user
      flash[:success] = "You have logged in"
      redirect_to controller: 'dashboard', action: 'index'
    else
      invalid
    end
  end

  def invalid
    render plain:"invalid"
  end

  def destroy
    @current_user = session[:current_user_id] = nil
    redirect_to registration_index_path
  end

  def show
    render plain:session[:current_user_id]
  end

  private
  def parameter
    params.require(:user).permit(:user_name, :password)
  end

end
