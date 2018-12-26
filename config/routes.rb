Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  get 'mypage/card/create' => 'mypages#buy'
  get 'mypage/logout' => 'mypages#logout'
  get 'mypage/listing' => 'mypages#listing'
  get 'mypage/purchase' => 'mypages#purchase'
  resources :mypages, path: 'mypage'
  delete 'items/:id' =>'items#destroy'
  # これ必要な数とアクションでルーティングしないとrake routesがキモい
  # resources :transactions, path: 'transaction/buy/:item_id'

  resources :transactions, path: 'transaction' do
    collection do
      get 'buy/:id' => 'transactions#buy'
      post 'pay/:id' => 'transactions#pay'
      get 'done/:id' => 'transactions#done'
    end
  end
end
