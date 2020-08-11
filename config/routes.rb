Rails.application.routes.draw do
  resources :card, only: [:new, :show] do
    collection do
      get 'index', to: 'card#index'
      get 'new', to: 'card#new'
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  # resources :items, only: [:index]
  resources :products, only: [:index, :new, :create]
  # 画像の表示
  # resources :images, only: [:show]

  devise_scope :user do
    get 'address', to: 'users/ragistrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "items#index"
 
end
