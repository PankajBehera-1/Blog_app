Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'log-in', to: 'devise/sessions#new'
    get 'sign-up', to: 'devise/registrations#new'
    delete 'log-out', to: 'devise/sessions#destroy'
    get 'reset-password', to: 'devise/passwords#new'
  end
  resources :posts
  root 'posts#index'
  resources :avatars, only: [:create, :update, :destroy]

end
