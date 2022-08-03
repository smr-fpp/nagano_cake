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
    @order.status = 0
    
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
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.status = 0
    @order.save!
    @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price
        @order_details.amount = cart_item.amount
        @order_details.making_status = 0
        @order_details.save
        current_customer.cart_items.destroy_all
      end
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.all
    @cart_items = CartItem.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :select_address, :address_id, :total_payment, :status)
  end
end
