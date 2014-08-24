class SessionsController < ApplicationController

  before_action :logged_out_required, only: :create
  before_action :logged_in_required, only: :destroy

  def create
    user = User.from_omniauth(allowed_params) #(env['omniauth.auth'])
    session[:user_id] = user.id if user
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  protected

  def allowed_params
    ActionController::Parameters.new(env['omniauth.auth']).permit(:provider, :uid, info: [:email, :name, :first_name, :last_name, :image, :token, :verified, urls: [:Facebook]], credentials: [:token, :expires_at, :expires], extra: [raw_info: [:id, :email, :first_name, :gender, :last_name, :link, :locale, :name, :timezone, :updated_time, :verified]])
  end

end