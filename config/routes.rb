Rails.application.routes.draw do
  get '/products', to: 'products#index'
  post '/purchases', to: 'purchases#create'
  devise_for :users


  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
