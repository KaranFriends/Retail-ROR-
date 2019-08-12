class AddressesController < ApplicationController

  def create
    Address.new(parameter.merge({user_id: session[:current_user_id]})).save
    redirect_to new_order_path
  end

  private
  
  def parameter
    params.require(:address).permit(:name,:contact_number,:address,:landmark)
  end
end
