Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      resources :users, only: [:create]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
        # get '/:user/played_games/', to: 'users#user_played_games'
      resources :blinds_names, only: [:create, :index]
        # post '/blinds_names/new', to: 'blinds_names#create'
        # get '/blinds_names', to: 'blinds_names#index'
      resources :game_locations, only: [:create, :index]
        # post '/game_locations/new', to: 'game_locations#create'
        # get '/game_locations', to: 'game_locations#index'
      resources :notes, only: [:create, :index]
        # post '/notes/new', to: 'notes#create'
        # get '/notes', to: 'notes#index'
      resources :game_names, only: [:create, :index]
        # post '/game_names/new', to: 'game_names#create'
        # get '/game_names', to: 'game_names#index'
        # get'/game_names/:id', to: 'game_names#show'
      resources :kill_statuses, only: [:create, :index]
        # get '/kill_statuses', to: 'kill_statuses#index'
      resources :played_games, only:[:create, :index, :show]
        # post '/played_games/new', to: 'played_games#create'
        # get '/played_games', to: "played_games#index"


    end
  end
end
