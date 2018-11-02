class Api::V1::GameNamesController < ApplicationController
  skip_before_action :check_authentication
  def create
    gameName = GameName.create(game_name_params)
    if gameName.valid?
      render json: { gameName: gameName }
    else
      render json: { errors: gameName.errors}
    end
  end

  def index
    gameNames = GameName.all
    render json: { gameNames: gameNames }
  end

  def update
  end

  def delete
  end

  private

  def game_name_params
    params.permit(:id, :game_title)
  end
end
