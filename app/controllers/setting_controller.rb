class SettingController < ApplicationController
  def index
    @user = User.find_by(id: session[:current_user_id])
  end

  def new
    render plain:"nsadfoiaejdoiq"
  end

  def update
    # render plain: params
    @p = User.find(session[:current_user_id])
    @p.update(params.require(:user).permit(:email,:password,:user_name,:phone_number,:alternate_number,:picture))
  end

  def destroy
    @delete = User.find(session[:current_user_id])
    @delete.picture.purge
  end

  private
  def article_params
    params.require(:user).permit(:email,:password,:user_name,:phone_number,:alternate_number,:picture)
  end
end
