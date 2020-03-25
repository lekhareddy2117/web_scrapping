Rails.application.routes.draw do
  
  resources :urls 
    get '/data', to: 'urls#data'
  root to: 'urls#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
