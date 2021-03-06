class Public::ItemsController < ApplicationController
  
  def index
    @items_count = Item.count
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end
  

  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end


end
