Rails.application.routes.draw do
  root 'products#new'
  resources :products, only: [:index, :new, :create]
end
