Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      resources :users, only: [:create]
    
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :blinds_names
      resources :game_locations
      resources :notes
      resources :game_names
      resources :tournament_names
      resources :played_games
    end
  end
end
