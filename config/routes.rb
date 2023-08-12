Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'posts#index'
  resources :avatars, only: [:create, :update, :destroy]

end
