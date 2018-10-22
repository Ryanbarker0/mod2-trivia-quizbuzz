Rails.application.routes.draw do

  resources :answers
  resources :users, only: [:index]
  resources :games
  resources :categories
  resources :questions

  root 'users#index'
end
