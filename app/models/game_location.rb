class GameLocation < ApplicationRecord
  has_many :played_games
  validates :place, uniqueness: {case_sensitive: false, message: 'Poker room location already in list; please select from list.'}
end
