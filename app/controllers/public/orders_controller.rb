class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
    
  end


  def confirm
      # @order = Order.new(order_params)
      # @order.postal_code = current_customer.postal_code
      # @order.address = current_customer.address
      # @order.name = current_customer.first_name + current_customer.last_name
    @order = Order.new(order_params)
    if @order.select_address == '1' 
    
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name    
    
    elsif @order.select_address == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end

  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end  
end
