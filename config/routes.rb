Rails.application.routes.draw do
  get 'products',  to: "products#index"
  get 'products/new', to: "products#new"
  post 'products', to: "products#create"
  get 'products/:id', to: "products#show"
  get "up" => "rails/health#show", as: :rails_health_check

  
end
