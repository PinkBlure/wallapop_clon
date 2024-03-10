Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Tipo de petición --> GET
  # Ruta --> /products
  # Controlador, dentro del controlador hay métodos o acciones
  # Conjunto de cosas por convención --> index
  patch '/products/:id', to: 'products#update'
  post '/products', to: 'products#create'
  get '/products/new', to: 'products#new', as: :new_product
  get '/products', to: 'products#index'
  get '/products/:id', to: 'products#show', as: :product
  get '/products/:id/edit', to: 'products#edit', as: :edit_product
end
