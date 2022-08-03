class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer
  end
  
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :select_address, :address_id, :total_payment, :status)
  end
  
end
