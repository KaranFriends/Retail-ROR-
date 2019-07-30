class SessionController < ApplicationController
  skip_before_action :require_login, only: [:new,:create]
  def index

  end

  def new
    @user = User.new
  end

  def create
    if @validity = User.find_by(user_name: article_params[:user_name])
      if @validity.password == article_params[:password]
        session[:current_user_id] = @validity.id
        current_user
        redirect_to controller: 'dashboard', action: 'index'
      else
        invalid
      end
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
  def article_params
    params.require(:user).permit(:user_name, :password)
  end

end
