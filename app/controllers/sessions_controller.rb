class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create

    @user = User.new(params.require(:user).permit(:user_name,:password))
    #render plain: @user.user_name

    if User.find_by user_name: @user.user_name and User.find_by user_name: @user.password
      session[:current_user_id] = @user.id
      redirect_to "http://localhost:3000/dashboard"
     else
      render 'invalid'
     end
  end

  # def show
  #   session[:current_user_id] = nil
  #   redirect_to action: :index
  # end

end
