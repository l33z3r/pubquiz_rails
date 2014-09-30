class Api::QuizMaster::BaseController < ApplicationController

  respond_to :json

  before_action :logged_in_required
  before_action :set_quiz_event

  private

  def set_quiz_event
    if params[:quiz_event_id]
      @quiz_event = current_user.quiz_events.status_running.where(id: params[:quiz_event_id].to_i).first
      unless @quiz_event
        render json: {message: 'Quiz Event not found'}, status: 404
        return false
      end
    end
  end

end