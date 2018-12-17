Rails.application.routes.draw do
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  get 'mypage/card/create' => 'mypages#card_create'
  resources :mypages, path: 'mypage'
end
