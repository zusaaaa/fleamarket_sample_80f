Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  # resources :items, only: [:index]
  resources :products, only: [:index, :new, :create, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  # 画像の表示
  # resources :images, only: [:show]

  devise_scope :user do
    get 'address', to: 'users/ragistrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "items#index"
 
end
