Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations/registrations' }
  resources :posts
  root 'posts#index'
  resources :users, only: [:new, :create]
end
