Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
root 'users#home'

get '/auth/facebook/callback' => 'sessions#create'
