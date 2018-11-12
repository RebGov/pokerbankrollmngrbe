class PlayedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game_location
  belongs_to :game_name
  belongs_to :blinds_name
  belongs_to :kill_status
  # belongs_to :tournament_name
  has_many :notes
  # scope :start_date_time, -> started_at, ended_at { where("started_at = 20130801 AND ended_at = 20130131", started_at, ended_at) }
  # scope :for_user_id, lambda { |user_id:| where(user_id: user_id) }

  accepts_nested_attributes_for :game_name
  accepts_nested_attributes_for :blinds_name
  accepts_nested_attributes_for :game_location
  # accepts_nested_attributes_for :touranment_name

  before_validation do |game|
    game.kill_status_id = game.kill_status_id == 'undefined' ? 1 : game.kill_status_id
    # (pokerKillPot)
    game.minutes = (game.end_date_time - game.start_date_time) / 60
    game.profit = game.cash_out - game.buy_in
    game.won_game = game.cash_out >= game.buy_in ? true : false
  end


  validates :buy_in, presence: true
  validates :cash_out, presence: true
  validates :game_name, presence: true
  validates :game_location, presence: true
  validates :profit, presence: true
  # validates :note_content, presence: false
  # validates :tournament, presence

  #cash-game only
  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
  validates :blinds_name_id, presence: true
  validates :minutes, presence: true

  #tournament-game only (stretch goal)
  validates :tournament_placement, presence: false, on: :create
  # validates_uniqueness_of :tournament_name, :scope => :another_column # allows foreign_id to be nil
  # validates :tournament_name, presence: false, on: :create
  validates :tournament_date, presence: false, on: :create




end

# belongs to both tournaments and cash-games
# t.bigint "user_id"
# t.boolean "won_game" - defined on frontend
# t.integer "buy_in"
# t.integer "cash_out"
# t.bigint "game_name_id"
# t.bigint "game_location_id"
# t.integer "profit" --defined on frontend
#notes belong to both tournament and cash_games; but are not necessary
# t.bigint "note_id"

# belongs only to chash games
# t.datetime "start_date_time"
# t.datetime "end_date_time"
# t.bigint "blinds_name_id"
# t.integer "minutes" -defined on frontend
# t.boolean "tournament"

#belongs only to tournaments
# t.string "tournament_placement"
# t.datetime "tournament_date"
# t.bigint "tournament_name_id"
