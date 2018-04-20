Rails.application.routes.draw do
  resources :reviews
  resources :poses
  resources :categories
  resources :users
  resources :sessions #does this work? 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'users#home'

get '/auth/facebook/callback' => 'sessions#create'
end
