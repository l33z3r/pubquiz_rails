class Api::V1::TeamsController < Api::V1::BaseController

  # todo Pusher

  respond_to :json

  before_action :authentication_required

  def index
    # GET  http://localhost:3000/api/v1/teams?quiz_event_id=1
    @quiz_event = QuizEvent.where(id: params[:quiz_event_id].to_i).first
    if @quiz_event.nil?
      render json: {message: 'Event not found'}, status: 404
    elsif @quiz_event.current?
      @teams = @quiz_event.teams
      render json: @teams, each_serializer: Api::V1::TeamsSerializer, status: 200
    else
      render json: {message: 'Event not current'}, status: 406
    end
  end

  def show
    # GET  http://localhost:3000/api/teams/1
    @team = Team.where(id: params[:id].to_i).first
    if @team
      if @team.quiz_event.current?
        render json: @team, serializer: Api::V1::TeamSerializer, status: 200
      else
        render json: {message: 'Event not found'}, status: 404
      end
    else
      render json: {message: 'Team not found'}, status: 404
    end
  end

  def create # make a new team
    # params = {quiz_event_id: 1, name: 'Some team name', app_version: '0.0.0'}
    # curl http://localhost:3000/api/v1/teams method POST

    # create a team
    @quiz_event = QuizEvent.where(id: params[:team][:quiz_event_id].to_i).happening_soon.first
    if @quiz_event.nil?
      render json: {message: 'Event not found'}, status: 404
    else
      @team = @quiz_event.teams.build(create_params)
      if @team.save
        render json: @team, each_serializer: Api::V1::TeamSerializer, status: 201
      else
        render json: {message: 'Team could not be created'}, status: 422
      end
    end
  end

  def update
    @team = Team.where(id: params[:id].to_i).first
    @quiz_event = @team.quiz_event
    if @quiz_event.current?
      @team = @quiz_event.teams.build(team_params)
      if @team.update_attributes(update_params)
        render json: @team, each_serializer: Api::V1::TeamSerializer, status: 201
      else
        render json: {message: 'Team could not be updated'}, status: 422
      end
    else
      render json: {message: 'Event not found'}, status: 404
    end
    # todo: PUSHER send a pusher event to all team members
  end

  protected

  def create_params
    params.require(:team).permit(:name, :quiz_event_id)
  end

  def update_params
    params.require(:team).permit(:name)
  end

end
