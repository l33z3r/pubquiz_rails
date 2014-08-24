class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # users and access control

  def current_user
    @current_user ||= (User.where(id: session[:user_id]).first if session[:user_id]) || nil
  end
  helper_method :current_user

  def logged_in_required
    unless current_user
      flash[:error] = 'You must be logged in to access that page'
      redirect_to root_url
      false
    end
  end
  helper_method :logged_in_required

  def logged_out_required
    if current_user
      flash[:error] = 'You must be logged out to access that page'
      redirect_to root_url
      false
    end
  end
  helper_method :logged_out_required

  def admin_required
    unless current_user && current_user.admin?
      flash[:error] = 'You must be an administrator to access that page'
      redirect_to root_url
      false
    end
  end
  helper_method :admin_required

end
