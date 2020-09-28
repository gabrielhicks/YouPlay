Rails.application.routes.draw do
  resources :videos
  resources :users
  resources :playlists
  resources :comments
  resources :playlist_videos
  get '/search', to: "videos#index", as: "search"
  post '/search', to: "videos#handle_search"
end
