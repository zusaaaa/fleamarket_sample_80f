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

end