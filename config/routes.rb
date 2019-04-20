Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  root 'items#index'

  resources 'items' do
    collection do
      get 'search' => 'items#search'
    end
  end
  # 出品ページのカテゴリー、ブランドの非同期通信用
  post 'items/category/search' => 'categories#search'
  post 'items/brand/search' => 'brands#search'
  post 'images' => 'images#create'

  get 'user/:id' => 'users#show'
  post 'rate/:id' => 'rates#create'

  resources :categories, only:[:show], path: 'category'

  resources :brands, only:[:show], path: 'brand'

  get 'mypage/card' => 'mypages#card'
  get 'mypage/card/create' => 'mypages#buy'
  get 'mypage/logout' => 'mypages#logout'
  get 'mypage/listing' => 'mypages#listing'
  get 'mypage/in_progress' => 'mypages#in_progress'
  get 'mypage/completed' => 'mypages#completed'
  get 'mypage/purchase' => 'mypages#purchase'
  get 'mypage/purchased' => 'mypages#purchased'
  get 'mypage/deliver_address' => 'mypages#deliver_address'
  get 'mypage/review' => 'mypages#review'
  get 'mypage/good' => 'mypages#good'
  get 'mypage/normal' => 'mypages#normal'
  get 'mypage/bad' => 'mypages#bad'

  resources :mypages, path: 'mypage'
  delete 'items/:id' =>'items#destroy'

  resources :transactions, path: 'transaction' do
    collection do
      get 'buy/:id' => 'transactions#buy'
      get 'bought/:id' => 'transactions#bought'
      post 'pay/:id' => 'transactions#pay'
      get 'done/:id' => 'transactions#done'
      get 'order_status/:id' => 'transactions#order_status'
      post ':id' => 'transactions#condition'
    end
  end
end
