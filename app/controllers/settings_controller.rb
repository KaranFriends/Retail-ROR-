class SettingsController < ApplicationController
  
  def edit
    @user = User.find_by(id: session[:current_user_id])
  end

  def show
    redirect_to edit_setting_path
  end

  def update
    # debugger
    # render plain: params
    @user = User.find(session[:current_user_id])
    @user.update(parameter)
    unless @user.save
      # debugger
      # flash[:destroy] = "Error"
      render :edit
    else
      flash[:success] = "successfully edited"
      redirect_to edit_setting_path
    end
  end

  def destroy
    @delete = User.find(session[:current_user_id])
    @delete.picture.purge
  end

  private
  def parameter
    params.require(:user).permit(:email,:password,:user_name,:phone_number,:alternate_number,:picture)
  end
end
