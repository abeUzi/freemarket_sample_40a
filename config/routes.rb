Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  resources :mypages, path: 'mypage'
end
