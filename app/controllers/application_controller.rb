class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :authenticate_admin!, except: [:top, :about]
# before_action :authenticate_customer!, except: [:top, :about, :index]
#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :encrypted_password, :address, :telephone_number, :is_deleted])
#   end

  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      '/admin'
    when Customer
      root_path
    end
  end
end
