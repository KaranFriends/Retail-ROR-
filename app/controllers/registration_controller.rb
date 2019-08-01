class RegistrationController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(parameter)
    @user.save
    render 'index'
  end

  private
  def parameter
    params.require(:user).permit(:user_name,:password,:email,:password,:phone_number,:alternate_number,:picture)
  end
end
