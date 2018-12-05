class Api::V1::GameLocationsController < ApplicationController
  skip_before_action :check_authentication
  def create
    gameLoaction = GameLocation.create(game_location_params)
    if gameLocation.valid?
      render json: { gameLocation: gameLocation }
    else
      render json: { errors: gameLocation.errors}
    end
  end

  def index
    gameLocations = GameLocation.all
    render json: { gameLocations: gameLocations }
  end

  def update
  end

  def delete
  end

  private

  def game_location_params
    params.permit(:id, :poker_room)
  end
end
