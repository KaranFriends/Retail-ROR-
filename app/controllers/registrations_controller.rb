class RegistrationsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def show
    redirect_to new_registration_path
  end

  def create
    @user = User.new(user_parameter)
    if @user.save
      EmailMailer.sign_up(@user.email,@user.user_name).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_parameter
    params.require(:user).permit(:user_name,:password,:email,:password,:phone_number,:alternate_number,:picture)
  end
end
