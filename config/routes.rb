Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :apod, only: :index
  resources :planets, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
