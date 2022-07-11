Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
  resources :genres, :items, :customers
  end
  
  namespace :public do
    get '/addresses' => 'addresses#index'
  end
  
  # namespace :public do
  # resources :customers
  # end

  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/quit' => 'public/customers#quit'
  patch '/customers/out' => 'public/customers#out'

  
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
