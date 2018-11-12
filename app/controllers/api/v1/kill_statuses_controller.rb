class Api::V1::KillStatusesController < ApplicationController
  skip_before_action :check_authentication
  def index
    killStatuses = KillStatus.all
    render json: { killStatuses: killStatuses }
  end
end
