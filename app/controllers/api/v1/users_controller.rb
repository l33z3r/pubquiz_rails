class Api::V1::UsersController < Api::V1::BaseController

  before_action :logged_in_required

  def show
    # params = {id: 1} # user's ID
    @user = current_user
    if @user && @user.id == params[:id].to_i
      render json: @user, serializer: Api::V1::UserSerializer
    else
      render json: {message: 'User not found'}, status: 404
    end
  end

end