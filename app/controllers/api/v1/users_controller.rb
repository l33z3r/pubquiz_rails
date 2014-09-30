class Api::V1::UsersController < Api::V1::BaseController

  before_action :logged_in_required

  def show
    # params = {id: 1} # user's ID
    # GET  http://localhost:3000/api/v1/users/1
    # 1 can be any number - the params[:id] is totally ignored
    @user = current_user
    render json: @user, serializer: Api::V1::UserSerializer, status: 200
  end

end