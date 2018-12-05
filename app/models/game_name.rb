class GameName < ApplicationRecord
  has_many :played_games
  validates :game_title, uniqueness: {case_sensitive: false, message: 'Game Name already taken; please select from list.'}
end
