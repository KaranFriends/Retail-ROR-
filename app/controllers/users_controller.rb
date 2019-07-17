  class UsersController < ApplicationController
    def index
      #@user = User.new
    end

    def new
      @user = User.new
    end

    def create
    #render plain: params.require(:user)
      
      @user = User.new(params.require(:user).permit(:user_name,:password))
      @user.save

      render 'index'
    end
  end
