class CardsController < ApplicationController
  def new
    @payment = parameter[:payment_id]
  end

  def index
    @payment_id = parameter_index[:id]
    @payment = Payment.find_by(id: @payment_id)
    @payment.update(mode: parameter_index[:mode],status: parameter_index[:status])
    @cards = TableCardDetail.where(user_id: session[:current_user_id])
  end

  def create
    TableCardDetail.create(parameter_create).save
    redirect_to cards_path(id: params[:id],mode: "card_payment",status: "pending")
  end

  private

  def parameter
    params.permit(:payment_id)
  end

  def parameter_create
    params.require(:card).permit(:id,:card,:card_number,:expiry,:cvv,:card_holder_name,:user_id)
  end

  def parameter_index
    params.permit(:id,:mode,:status)
  end

end
