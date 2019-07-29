class RegistrationController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(article_params)
    @user.save
    render 'index'
  end

  private
  def article_params
    params.require(:user).permit(:user_name,:password,:email,:password,:phone_number,:alternate_number)
  end
end
