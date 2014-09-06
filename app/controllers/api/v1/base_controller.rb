class Api::V1::BaseController < ApplicationController

  respond_to :json

  def authentication_required
    unless current_user
      if params[:app_version]
        render json: {available_platforms: User::OAUTH_PLATFORMS}, status: 401
      else
        # You're here because you scanned the QR code with a normal QR scanner
        # and didn't do it from within our native app.
        flash[:warning] = 'Something...'
        redirect_to root_url
      end
    end
  end

end