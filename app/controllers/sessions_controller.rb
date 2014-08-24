class SessionsController < ApplicationController

  before_action :logged_out_required, only: :create
  before_action :logged_in_required, only: :destroy

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end