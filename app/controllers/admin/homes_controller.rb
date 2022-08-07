class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.page(params[:page]).per(8)
    @order_details = OrderDetail.all
    @subamount = 0
  end
end
