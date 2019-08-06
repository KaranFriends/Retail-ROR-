class OrderController < ApplicationController
  def new
    render plain: params
  end
end
