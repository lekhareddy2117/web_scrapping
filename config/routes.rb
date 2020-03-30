Rails.application.routes.draw do
  devise_for :users
  default_url_options :host => "localhost"
  resources :stocks_charts
  resources :urls 
    get '/data', to: 'urls#save_data'
    get '/chart', to: 'urls#chart'
  root to: 'urls#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
