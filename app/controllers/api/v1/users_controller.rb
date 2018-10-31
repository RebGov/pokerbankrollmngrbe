class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?

      render json: { user: UserSerializer.new(@user) }, status: :created #201

    else
      render json: { error: 'failed to create user' }, status: :not_acceptable #406
    end

  end

  private
  def user_params
    params.permit(:id, :email, :password, :first_name, :last_name, :username)
  end

end
