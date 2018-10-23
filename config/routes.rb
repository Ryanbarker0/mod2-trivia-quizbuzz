Rails.application.routes.draw do

  resources :answers
  resources :users
  resources :games
  resources :categories
  resources :questions

  root 'application#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/summary', to: 'questions#summary'

end
