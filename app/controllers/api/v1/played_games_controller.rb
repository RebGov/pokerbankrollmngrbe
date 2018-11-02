class Api::V1::PlayedGamesController < ApplicationController
  skip_before_action :check_authentication
  def create

      playedGame = PlayedGame.create(played_games_params)
      if playedGame.valid?
        render json: { playedGame: playedGame }
      else
        render json: { errors: playedGame.errors}
      end

  end

  def index
    playedGames = PlayedGame.all
    render json: { playedGames: playedGames }
  end

  def update
  end

  def delete
  end

  private

  def played_games_params
    params.permit(:id, :user_id, :start_date_time, :end_date_time, :buy_in, :cash_out, :game_location_id, :game_name_id, :blinds_name_id, :tournament, :notes_id, :profit, :minutes, :won_game)
  end
end
