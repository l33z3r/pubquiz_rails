class Api::V1::QuizEventsController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required, except: [:index]

  def index # list all nearby events
    # GET  http://localhost:3000/api/v1/quiz_events?lat=53.5&lon=-6.0&accuracy=100

    # Find a list of possible events based on lat/lon or request.ip_address, and the current time
    range_in_degrees = (params[:accuracy] || 5).to_f * 0.01 # 0.1 will need fine-tuning later
    if params[:lat].to_f == 0.0 && params[:lon].to_f == 0.0
      render json: {message: 'Position data required'}, status: 404
    else
      @events = QuizEvent.near(params[:lat].to_f, params[:lon].to_f, range_in_degrees).happening_soon
      render json: @events, each_serializer: Api::V1::QuizEventsSerializer, status: 200
    end
  end

  def show
    # GET  http://localhost:3000/api/v1/quiz_events/1
    @quiz_event = QuizEvent.where(id: params[:id].to_i).first
    if @quiz_event
      if @quiz_event.current?
        if @quiz_event.event_team_members.map(&:user_id).include?(current_user.id)
          render json: @quiz_event, serializer: Api::V1::QuizEventSerializer, status: 200
        else
          # player is not in that event
          Rails.logger.error 'API:EventsController#Show error 403 player not linked to event'
          render json: {message: 'Player not authorised'}, status: 403 # forbidden
        end
      else
        # it's too early / too late
        Rails.logger.error 'API:EventsController#Show error 406 Event not current'
        render json: {message: 'Event not current'}, status: 406 # not acceptable
      end
    else # @quiz_event == nil
      Rails.logger.error 'API:EventsController#Show error 404 Event not found'
      render json: {message: 'Event not found'}, status: 404 # not found
    end
  end

end
