class GameLocation < ApplicationRecord
  has_many :played_games
  validates :poker_room, uniqueness: {case_sensitive: false, message: 'Poker room location already in list; please select from list.'}
end
