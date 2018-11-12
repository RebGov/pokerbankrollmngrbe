Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      resources :users, only: [:create]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
      resources :blinds_names
        post '/blinds_name/new', to: 'blinds_names#create'
        get '/blinds_names', to: 'blinds_names#index'
      resources :game_locations
        post '/game_location/new', to: 'game_locations#create'
        get '/game_locations', to: 'game_locations#index'
      resources :notes
        post '/note/new', to: 'notes#create'
        get '/notes', to: 'notes#index'
      resources :game_names
        post '/game_name/new', to: 'game_names#create'
        get '/game_names', to: 'game_names#index'
      resources :kill_statuses
        get '/kill_statuses', to: 'kill_statuses#index'
      resources :played_games
        post '/played_game/new', to: 'played_games#create'
        get '/played_games', to: 'played_games#index'

    end
  end
end
