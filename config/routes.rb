Rails.application.routes.draw do
  resources :card, only: [:index, :new, :create, :show, :edit, :destroy] do
    member do
      post 'buy', to: 'card#buy'
      get 'done', to: 'card#done'
    end
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  resources :items, only: [:index, :show]

  resources :products, only: [:index, :new, :create, :show, :edit]
  resources :products do
    resources :images
    resources :comments, only: [:create, :new, :destroy]
    collection do
      get 'search'
    end
  end

  devise_scope :user do
    get 'address', to: 'users/ragistrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "items#index"
end
