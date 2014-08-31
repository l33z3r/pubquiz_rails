class Api::PlayersController < Api::BaseController

  respond_to :json

  before_action :authentication_required, except: [:create]

  def create
    user = User.from_omniauth(allowed_params) #(env['omniauth.auth'])
    if user
      session[:user_id] = user.id
      render json: {player_guid: 'ABCDEFG1234567', first_name: 'Frank', last_name: 'Grimes',
                          profile_url: 'http://facebook.com/test.jpg'},
                   status: 201
    else
      Rails.logger.error 'API:PlayersController#create error 422 ' # todo
      render json: {platform: params[:platform]}, status: 422
    end
  end

  def update # lock contestant out of the current round
    params = {id: 'person_guid', dropped_out_at_epoch: 1409360642, reason: 'incoming phone call'}
    # log the user as being diqualified from that round
    render json: {}, status: 200
  end

  protected

  def allowed_params
    ActionController::Parameters.new(env['omniauth.auth']).permit(:provider, :uid, info: [:email, :name, :first_name, :last_name, :image, :token, :verified, urls: [:Facebook]], credentials: [:token, :expires_at, :expires], extra: [raw_info: [:id, :email, :first_name, :gender, :last_name, :link, :locale, :name, :timezone, :updated_time, :verified]])
  end

end
