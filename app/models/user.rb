class User < ApplicationRecord
  has_many :played_games
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}
  # validates :username, uniqueness: true
  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, length: {minimum: 2}
  validates :password, length: { in: 6..20 }
  # scope :played_games
   # scope :start_date_time, -> { where(start_date_time: 3.years.ago.all_year).order("start_date_time desc") }


end
#missing: boolean terms_of_service_read & boolean terms_of_service_accepted
#include privacy and policy statements(?)
