  class RegistrationsController < ApplicationController
    def index

    end

    def new
      @user = User.new
    end

    def create
    #render plain: params.require(:user)

      @user = User.new(params.require(:user).permit(:user_name,:password,:email,:password,:phone_number,:alternate_number))

      @user.save
      render 'index'
    end
  end
