class CardsController < ApplicationController
  def new
    @payment = params[:payment_id]
  end

  def index
    @payment_id = params[:id]
    @payment = Payment.find_by(id: @payment_id)
    @payment.update(mode: params[:mode],status: params[:status])
    @cards = TableCardDetail.where(user_id: session[:current_user_id])
  end

  def create
    TableCardDetail.create(parameter_create).save
    redirect_to cards_path(id: params[:id],mode: "card_payment",status: "pending")
  end

  private

  def parameter_create
    params.require(:card).permit(:id,:card,:card_number,:expiry,:cvv,:card_holder_name,:user_id)
  end

end
