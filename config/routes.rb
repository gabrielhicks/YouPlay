Rails.application.routes.draw do
  resources :videos do
    resources :comments
  end
  resources :users
  resources :playlists
  resources :comments
  resources :playlist_videos

  get '/search', to: "videos#index", as: "search"
  post '/search', to: "videos#handle_search"
  get "/login", to: "users#login", as: "login"
  post "/login", to: "users#handle_login"
  delete "/logout", to: "users#logout"

  root 'videos#index'
end
