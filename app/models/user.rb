class User < ApplicationRecord
  has_many :played_games
  has_secure_password
end
