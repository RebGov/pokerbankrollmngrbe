class BlindsName < ApplicationRecord
  has_many :played_games
  validates :blinds, uniqueness: {case_sensitive: false, message: 'Blinds structure already in list; please select from list.'}
end
