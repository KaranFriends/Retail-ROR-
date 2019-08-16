class DashboardsController < ApplicationController
  def show
    unless Cart.find_by(user_id: @current_user)
      Cart.create(user_id: @current_user)
    end

    @user = User.find_by(id: @current_user)
    @addresses = Address.where(user_id: @user.id)
    @cards = Card.where(user_id: @user.id)
    @selected = params[:selected]
  end

  def profile
    @user = User.find_by(id: @current_user)
  end

  def addresses
    @addresses = Address.where(user_id: @current_user)
  end

  def edit_address
      @address = Address.find(params[:id])
  end

  def cards
    user = User.find_by(id: @current_user)
    @cards = Card.where(user_id: @current_user)
  end

  def edit_card
    @card = Card.find(params[:id])
  end

  def order_placed
    @user = User.find_by(id: @current_user)
    @orders = Order.where(user_id: @user.id)
  end

  def order_recieved
    @user = User.find_by(id: @current_user)
  end

end
