Rails.application.routes.draw do
  # root 'items#index'
  root 'products#index'
  resources :products, only: [:index, :create, :new, :show]

  # 画像の表示
  resources :images, only: [:show]
end
