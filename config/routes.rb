Rails.application.routes.draw do
  resources :card, only: [:new, :create, :show, :edit, :destroy] do
    member do
      post 'buy', to: 'card#buy'
    end
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  resources :items, only: [:index, :show]

  resources :products do
    resources :images
    resources :comments, only: [:create, :new, :destroy]

    member do
      get :purchase
      post :buy
    end

    collection do
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  devise_scope :user do
    get 'address', to: 'users/ragistrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "items#index"
end
