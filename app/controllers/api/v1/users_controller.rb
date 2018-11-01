class Api::V1::UsersController < ApplicationController

  skip_before_action :check_authentication, only: [:create]

  def create

    user = User.create(user_params)

    if user.valid?
    exp = Time.now.to_i + 24 * 3600
    render json: {
      user: UserSerializer.new(user),
      token: encode_token({
        user_id: user.id,
        exp: exp
        })
     }
    else
      render json: { error: 'Email already taken. Please login if you already have an account or check your email.' }
    end
  end

  def profile
    render json: current_user
  end

  private
  def user_params
    params.permit(:id, :email, :password, :first_name, :last_name, :username)
  end

end
