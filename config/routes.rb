Rails.application.routes.draw do
  resources :videos
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/search', to: "videos#search", as: "search"
post '/search', to: "videos#handle_search"
end
