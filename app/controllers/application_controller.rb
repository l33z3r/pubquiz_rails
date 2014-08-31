class ApplicationController < ActionController::Base

  http_basic_authenticate_with name: 'dan', password: 'lee' if Rails.env.production? || Rails.env.staging?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Time::DATE_FORMATS[:simple] = '%-e %b %Y'
  Time::DATE_FORMATS[:standard] = '%-e %b %Y %H:%M %Z'

  def self.generate_random_code(length_required)
    # call this using - ApplicationController.generate_random_code(20)
    length_required = 5 if length_required.to_i < 5
    answer = ''
    character_list = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    number_of_characters = character_list.size
    length_required.times do
      answer << character_list[rand(number_of_characters)]
    end
    answer
  end

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
