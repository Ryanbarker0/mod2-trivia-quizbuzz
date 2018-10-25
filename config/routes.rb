Rails.application.routes.draw do

  resources :answers
  resources :users
  resources :games
  resources :categories
  resources :questions

  root 'application#home'

  get '/register', to: 'users#new', as: 'register'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/summary', to: 'questions#summary'
  get '/hot_streak', to: 'questions#hot_streak'
  # get '/hot_streak_summary', to: '/hot_streak_summary'

  get '/correct', to: 'answers#correct'
  get '/incorrect', to: 'answers#incorrect'

  get '/feed', to: 'categories#feed'

end
