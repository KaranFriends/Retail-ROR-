class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create

    @user = User.new(params.require(:user).permit(:user_name,:password))
    #render plain: @user.user_name

    @validity = User.find_by(user_name: params[:user][:user_name])

    if @validity.password = params[:user][:password])
      session[:current_user_id] = @user.id
      render "dashboards/index"
    else
      self.invalid
    end
  end

  def invalid
    render plain:"invalid"
  end



  # def show
  #   session[:current_user_id] = nil
  #   redirect_to action: :index
  # end

end
