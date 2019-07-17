class SessionsController < ApplicationController
  def index
    @user = User.new
  end
  def new
    render plain: @user.user_name

  end
  def create

    @user = User.new(params.require(:user).permit(:user_name,:password))
    #render plain: @user.user_name

    if User.find_by user_name: @user.user_name and User.find_by user_name: @user.password
      session[:current_user_id] = @user.id
      render 'valid'
     else
      render 'invalid'
     end
  end

  def show
    session[:current_user_id] = nil 
    redirect_to action: :index
  end

end
