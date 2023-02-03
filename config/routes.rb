Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/bikes', to: 'bikes#index'
  get '/bikes/:id', to: 'bikes#show'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:manufacturer_id/bikes', to: 'manufacturer_bikes#index'
  
end
