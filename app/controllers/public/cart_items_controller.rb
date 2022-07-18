class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
      redirect_to cart_items_path
    else
      
      @cart_item.customer_id = current_customer.id
      @item = Item.find(cart_item_params[:item_id])
      @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  
  
  
 
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
  
end
