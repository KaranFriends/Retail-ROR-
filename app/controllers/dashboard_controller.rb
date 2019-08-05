class DashboardController < ApplicationController
  def index
    unless Cart.find_by(user_id: session[:current_user_id])
        Cart.create(user_id: session[:current_user_id])
      end
  end
end
