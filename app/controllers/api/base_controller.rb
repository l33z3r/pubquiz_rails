class Api::BaseController < ApplicationController

  respond_to :json

  def authentication_required
    unless current_user
      render json: {available_platforms: User::OAUTH_PLATFORMS}, status: 401
    end
  end

end