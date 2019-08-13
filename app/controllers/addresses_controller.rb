class AddressesController < ApplicationController

  def create
    Address.new(parameter.merge({user_id: session[:current_user_id]})).save
    if params[:type] == "order"
      redirect_to new_order_path
    elsif params[:type] == "dashboard"
      flash[:success] = "address added successsfully"
      redirect_to dashboard_path(selected: "address")
    end
  end

  def destroy
    @address = Address.find_by(id: params[:id])
    @address.destroy
    redirect_to dashboard_path(selected: "address")
  end

  def update
    @address = Address.find(params[:id])
    @address.update(parameter)
    redirect_to dashboard_path(selected: "address")
  end

  private

  def parameter
    params.require(:address).permit(:name,:contact_number,:address,:landmark)
  end
end
