class Public::CustomersController < ApplicationController
  def show
    
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to '/customers/my_page'
  end
  
  def quit
    
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
   
  end 
  
  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    # flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  
  def new

  end
  
  def create

  end
  
  protected

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :encrypted_password, :address, :telephone_number, :is_deleted)
  end
end
