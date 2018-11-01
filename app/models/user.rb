class User < ApplicationRecord
  has_many :played_games
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}
  validates :username, uniqueness: { case_sensitive: false }
end
