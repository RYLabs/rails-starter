Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'subscriptions#show'

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login', 
    sign_out: 'logout',
    registration: 'register',
  }

  namespace :api, defaults: { format: :json } do
    devise_scope :user do
      post    'login',    to: 'auth/sessions#create'
      delete  'logout',   to: 'auth/sessions#logout'
      post    'register', to: 'auth/registrations#create'
    end
  end

  resource :subscription
  resource :card
end
