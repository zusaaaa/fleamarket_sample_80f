Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  resources :items, only: [:index]
  resources :products, only: [:index, :new, :create]
  # 画像の表示
  # resources :images, only: [:show]

  devise_scope :user do
    get 'address', to: 'users/ragistrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "items#index"
 
end
