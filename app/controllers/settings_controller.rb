class SettingsController < ApplicationController

  def edit
    @user = User.find(@current_user)
  end

  def show
    redirect_to edit_setting_path
  end

  def update
    @user = User.find(@current_user)
    unless @user.update_attributes(user_parameter)
      render :edit
    else
      flash[:success] = "successfully edited"
      redirect_to edit_setting_path
    end
  end

  def destroy
    @delete = User.find(@current_user)
    @delete.picture.purge
  end

  private
  def user_parameter
    params.require(:user).permit(:email,:password,:user_name,:phone_number,:alternate_number,:picture)
  end
end
