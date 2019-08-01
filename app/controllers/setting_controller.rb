class SettingController < ApplicationController
  def index
    @user = User.find_by(id: session[:current_user_id])
  end

  def new
    render plain:"nsadfoiaejdoiq"
  end

  def update
    # render plain: params
    @user = User.find(session[:current_user_id])
    @user.update(parameter)
  end

  def destroy
    @delete = User.find(session[:current_user_id])
    @delete.picture.purge
    # @word = "hi"
  end

  private
  def parameter
    params.require(:user).permit(:email,:password,:user_name,:phone_number,:alternate_number,:picture)
  end
end
