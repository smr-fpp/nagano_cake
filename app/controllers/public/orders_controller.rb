class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end


  def confirm
    @total = 0
    @total_payment = 0
    @shipping_cost = 800
    
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    
    if params[:order][:select_address] == '1' 
    
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name    
   
    elsif params[:order][:select_address] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
    else
    end
    
  end
  
  def create
    @order = Order.new(order_params)
    @order.status = 0
    @order.save!
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :select_address, :address_id, :total_payment, :status, :order_id, :status)
  end  
end
