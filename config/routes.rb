Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations/registrations', sessions: 'users/registrations/sessions' }
  resources :posts
  root 'posts#index'
  resources :users, only: [:new, :create]

  # get "/users/sign_in", to: "devise/sessions#new"
  # post "/users/sign_in", to: "users/registrations/sessions#create"

  # as :user do
  #   post '/registrations/sign_in', to: 'sessions#create'
  #   delete '/registrations/sign_out', to: 'sessions#destroy'
  # end
end
