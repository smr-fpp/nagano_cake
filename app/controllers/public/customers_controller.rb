class Public::CustomersController < ApplicationController
  def show
    
  end

  def edit
    
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(current_customer.id)
  end
  def new

  end
  
  def create

  end
end
