class Api::V1::UsersController < ApplicationController

  skip_before_action :check_authentication, only: [:create]

  def create

    user = User.create(user_params)

    if user.valid?
    exp = Time.now.to_i + 24 * 3600
    render json: {
      user: user,
      jwt: encode_token({
        user_id: user.id,
        exp: exp
        })
     }
    else
      render json: { error: user.errors }
      # user.errors
    end
  end

  def profile
    render json: current_user, include: { played_games: { include: [ :game_location, :notes, :blinds_name, :game_name ]}}
  end

  private
  def user_params
    params.permit(:id, :email, :password, :first_name, :last_name, :username, notes:[])
  end

end
