Rails.application.routes.draw do
  # resources :comments
  resources :posts
  resources :users, only: [:index, :show, :create]
  resource :user, only: [:destroy, :update]
  post '/auth/login', to: 'authentication#login'
  get '/user', to: 'users#user'
  get '/users/:id/posts', to: 'users#posts'
  get '/posts/:post_id/comments', to: 'comments#index'
  post '/posts/:post_id/comments', to: 'comments#create'
  delete '/posts/:post_id/comments/:comment_id', to: 'comments#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
