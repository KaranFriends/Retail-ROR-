class DashboardsController < ApplicationController
  def show
    unless Cart.find_by(user_id: session[:current_user_id])
      Cart.create(user_id: session[:current_user_id])
    end

    @user = User.find_by(id: session[:current_user_id])
    @addresses = Address.where(user_id: session[:current_user_id])
    @selected = params[:selected]
  end

  def profile
    @user = User.find_by(id: session[:current_user_id])
  end

  def addresses
    @addresses = Address.where(user_id: session[:current_user_id])
  end

  def edit_address
      @address = Address.find(params[:id])
  end

  def cards
    @user = User.find_by(id: session[:current_user_id])
  end

  def order_placed
    @user = User.find_by(id: session[:current_user_id])
    @orders = Order.where(user_id: @user.id)
  end

  def order_recieved
    @user = User.find_by(id: session[:current_user_id])
  end

end
