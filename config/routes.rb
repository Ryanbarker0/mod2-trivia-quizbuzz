Rails.application.routes.draw do
  resources :answers
  resources :users
  resources :games
  resources :categories
  resources :questions
end
