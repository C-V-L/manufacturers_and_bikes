Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'
  get '/bikes', to: 'bikes#index'
  get '/bikes/:id', to: 'bikes#show'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:manufacturer_id/bikes', to: 'manufacturer_bikes#index'
  get '/manufacturers/:manufacturer_id/edit', to: 'manufacturers#edit'
  get '/manufacturers/:manufacturer_id/bikes/new', to: 'manufacturer_bikes#new'
  post '/manufacturers/:manufacturer_id/bikes', to: 'manufacturer_bikes#create'
  get '/bikes/:id/edit', to: 'bikes#edit'
  patch '/bikes/:id', to: 'bikes#update'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  delete '/manufacturers/:id', to: 'manufacturers#destroy'
  delete '/bikes/:id', to: 'bikes#destroy'
  delete '/manufacturers/:id/bikes/:bike_id', to: 'manufacturer_bikes#destroy'
end
