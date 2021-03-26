Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:index, :show, :create]
  resource :user, only: [:destroy, :update]
  post '/auth/login', to: 'authentication#login'
  get '/user', to: 'users#user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
