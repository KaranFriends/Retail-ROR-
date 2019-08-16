class CardsController < ApplicationController
  def new
    @payment_id = params[:id]
    @card = Card.new
  end

  def index
    @payment_id = params[:id]
    payment = Payment.find_by(id: @payment_id)
    payment.update_attributes(mode: params[:mode],status: params[:status])
    @cards = Card.where(user_id: @current_user)
  end

  def create
    @card = Card.new(card_parameter)
    if params[:type] == "order"
      if @card.save
        @payment_id = params[:id]
        if @card.save
          redirect_to cards_path(id: @payment_id,mode: "card_payment",status: "pending")
        else
          flash[:danger] = "You have not entered a valid card"
          render :new
        end
      else
        flash[:danger] = "Card not added"
        redirect_to dashboard_path(selected: "card")
      end
    elsif params[:type] == "dashboard"
      if @card.save
        flash[:success] = "Card added successsfully"
        redirect_to dashboard_path(selected: "card")
      else
        flash[:danger] = "Card not added"
        redirect_to dashboard_path(selected: "card")
      end
    end
  end

  def destroy
    card = Card.find(params[:id])
    if card.destroy
      flash[:success] = "card deleted successfully"
      redirect_to dashboard_path(selected: "card")
    else
      flash[:danger] = "deletion failed"
    end
  end

  def update
    card = Card.find(params[:id])
    card.update(card_parameter)
    redirect_to dashboard_path(selected: "card")
  end

  private

  def card_parameter
    params.require(:card).permit(:card_number,:expiry,:cvv,:card_holder_name,:user_id)
  end

end
