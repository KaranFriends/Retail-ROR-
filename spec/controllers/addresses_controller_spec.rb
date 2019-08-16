require 'rails_helper'

RSpec.describe AddressesController, type: :controller do

  it "address -> create action" do
    user = User.create(user_name: "asdabsdjbasd", password: "123", email: "andoiandoinsi", phone_number: 1234567890, alternate_number: 1234567890)
    address = Address.new(name: "karan", contact_number: 1234567890, address: "ratlam", landmark: "ajsoidnjs", user_id: user.id)
    if address.save
      # if params[:type] == "order"
        redirect_to new_order_path
      # elsif params[:type] == "dashboard"
      #   # flash[:success] = "address added successsfully"
      #   redirect_to dashboard_path(selected: "address")
      # end
    else
      # flash[:danger] = "Address not added"
      redirect_to dashboard_path(selected: "address")
    end

    expect(response).to redirect_to(new_order_path)

  end
end
