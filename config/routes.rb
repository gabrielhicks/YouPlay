Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :videos
  resources :categories
  resources :playlist
end
