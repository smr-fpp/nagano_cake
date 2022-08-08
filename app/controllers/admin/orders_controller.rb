class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    
    if @order.status == "confirm_payment"
      @order_details.update_all(making_status: 1)
    else  
      
    end

    redirect_to request.referer

  end
  
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :select_address, :address_id, :total_payment, :status)
  end
  
end
