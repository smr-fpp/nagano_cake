class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    redirect_to 'orders_confirm_path'
  end

  def confirm
    
  end

  def complete
  end

  def index
  end

  def show
  end
  
  def orders.params
    params.require(:orders).permit(:name, :postal_code, :address, :shipping_cost, :total_payment, :payment_method, :status)
  end   
end
