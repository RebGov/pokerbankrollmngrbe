class Api::V1::BlindsNamesController < ApplicationController
skip_before_action :check_authentication
  def create
    blindsName = BlindsName.create(blinds_name_params)
    if blindsName.valid?
      render json: { blindsName: blindsName }
    else
      render json: { errors: blindsName.errors}
    end
  end

  def index
    blindsNames = BlindsName.all
    render json: { blindsNames: blindsNames }
  end

  def update
  end

  def delete
  end

  private

  def blinds_name_params
    params.permit(:id, :blinds)
  end
end
