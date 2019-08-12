class DashboardController < ApplicationController
  def show
    unless Cart.find_by(user_id: session[:current_user_id])
      Cart.create(user_id: session[:current_user_id])
    end

    @user = User.find_by(id: session[:current_user_id])
  end

end
