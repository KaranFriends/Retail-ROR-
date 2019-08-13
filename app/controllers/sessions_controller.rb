class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    @current_user = session[:current_user_id] = nil
    if @user = User.authenticate(parameter)
      session[:current_user_id] = @user.id
      current_user
      flash[:success] = "You have logged in"
      redirect_to controller: 'dashboards', action: 'show'
    else
      redirect_to new_session_path
      flash[:danger] = "Invalid login credentials"
    end
  end

  def destroy
    @current_user = session[:current_user_id] = nil
    redirect_to root_path
  end

  def show
    render plain:session[:current_user_id]
  end

  private
  def parameter
    params.require(:user).permit(:user_name, :password)
  end

end
