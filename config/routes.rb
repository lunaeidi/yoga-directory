Rails.application.routes.draw do

  resources :reviews
  resources :poses
  resources :categories
  resources :levels, only: [:show] do
    resources :poses, only: [:show, :new, :index]
  end
  resources :pose_categories, only: [:new, :create, :index]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :users, only: [:index,:show] do
    resources :poses, only: [:show, :new, :edit, :index]
  end

#should nest poses within users?
#   resources :posts do
#   resources :comments
# end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'users#home'

get '/auth/facebook/callback' => 'sessions#create'
end
