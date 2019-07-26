class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new,:create]
def index

end
  def new
    @user = User.new
  end

  # def create
  #     if user = User.authenticate(params[:user_name], params[:password])
  #       # Save the user ID in the session so it can be used in
  #       # subsequent requests
  #       session[:current_user_id] = user.id
  #       redirect_to root_url
  #     end
  #   end
  def create
    #if user = User.authenticate(params[:user][:username], params[:user][:password])
    if user = User.find_by( user_name: params[:user][:user_name]) && User.find_by(password: params[:user][:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to :controller=>'dashboards', :action=>'index'
    else
      self.invalid
    end
  end


  # def create
  #
  #   @user = User.new(article_params)
  #   #render plain: @user.user_name
  #
  #
  #   @validity = User.find_by(user_name: params[:user][:user_name])
  #   # render plain:@validity[:user]
  #   if @validity[:password] == params[:user][:password]
  #     session[:current_user_id] = @user.id
  #     redirect_to :controller=>'dashboards', :action=>'index'
  #   else
  #     self.invalid
  #   end
  # end

  def invalid
    render plain:"invalid"
  end

  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    # flash[:notice] = "You have successfully logged out."
    # render plain:"You have been logged out"
    redirect_to registrations_path
  end
def show
  render plain:session[:current_user_id]
end
  private
  def article_params
    params.require(:user).permit(:user_name, :password)
  end

  # def show
  #   session[:current_user_id] = nil
  #   redirect_to action: :index
  # end

end
