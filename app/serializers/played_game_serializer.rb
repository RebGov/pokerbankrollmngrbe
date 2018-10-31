class PlayedGameSerializer < ActiveModel::Serializer
  attributes :id, :start_date_time, :end_date_time, :blinds_name_id, :game_name_id, :tournament, :tournament_name_id, :tournament_placement,:tournament_date, :note_id, :buy_in, :cash_out, :game_location_id, :game_name_id, :profit, :won_game, :minutes, :user_id
end
