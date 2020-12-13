Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login', 
    sign_out: 'logout',
    registration: 'register',
  }

  namespace :api, defaults: { format: :json } do
    devise_scope :user do
      post    'signin',   to: 'auth/sessions#create',       as: :signin
      delete  'logout',   to: 'auth/sessions#logout',       as: :logout
      post    'register', to: 'auth/registrations#create',  as: :signup
    end
  end
end
