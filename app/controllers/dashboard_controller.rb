class DashboardController < ApplicationController
  def index

    unless Cart.find_by(user_id: session[:current_user_id])
        Cart.create(user_id: session[:current_user_id])
      end

      unless TableCardDetail.find_by(user_id: session[:current_user_id],card_holder_name: "cash_on_delivery_card")
          TableCardDetail.create(user_id: session[:current_user_id],card_holder_name: "cash_on_delivery_card")
      end

  end

  def address
    # debugger
    Address.new(name: parameter[:name], contact_number: parameter[:contact_number], address: parameter[:address], landmark: parameter[:landmark], user_id: session[:current_user_id]).save
    redirect_to new_order_path
  end

  private

  def parameter
      params.require(:address).permit(:name,:contact_number,:address,:landmark)
  end
end
