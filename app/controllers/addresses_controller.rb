class AddressesController < ApplicationController

  def create
    address = Address.new(parameter.merge({user_id: session[:current_user_id]}))
    if address.save
      if params[:type] == "order"
        redirect_to new_order_path
      elsif params[:type] == "dashboard"
        flash[:success] = "address added successsfully"
        redirect_to dashboard_path(selected: "address")
      end
    else
      flash[:destroy] = "Address not added"
      redirect_to dashboard_path(selected: "address")
    end
  end

  def destroy
    @address = address_finder
    @address.destroy
    redirect_to dashboard_path(selected: "address")
  end

  def update
    @address = address_finder
    @address.update_attribute(parameter)
    redirect_to dashboard_path(selected: "address")
  end

  def address_finder
    Address.find_by(id: params[:id])
  end

  private

  def parameter
    params.require(:address).permit(:name,:contact_number,:address,:landmark)
  end
end
