class PlayedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game_location
  belongs_to :game_name
  belongs_to :blinds_name
  belongs_to :tournament_name
  belongs_to :note
end
