Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  get 'mypage/logout' => 'mypages#logout'
  resources :mypages, path: 'mypage'

  # これ必要な数とアクションでルーティングしないとrake routesがキモい
  # resources :transactions, path: 'transaction/buy/:item_id'

  resources :transactions, path: 'transaction/buy'
end
