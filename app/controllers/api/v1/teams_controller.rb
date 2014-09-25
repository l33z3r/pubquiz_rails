class Api::V1::TeamsController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required

  def index
    # sample URL:
    # GET  http://localhost:3000/api/v1/teams?quiz_event_id=1

    # first, find the event.
    @quiz_event = QuizEvent.where(id: params[:quiz_event_id].to_i).happening_soon.first

    if @quiz_event.nil?
      render json: {message: 'Event not found'}, status: 404
    else
      @teams = @quiz_event.teams
      render json: @teams, each_serializer: Api::V1::TeamsSerializer, status: 200
    end
  end

  def show
    # sample URL:
    # GET  http://localhost:3000/api/teams/1
    @team = Team.where(id: params[:id].to_i).first
    if @team.quiz_event


    end
    params = {team_id: 12}
    response = {
            id: 12,
            quiz_event_id: 44,
            name: 'Team name',
            event_team_members: [
                    {user_id: 123, team_id: 12},
                    {user_id: 456, team_id: 12},
            ],
            users: [
                    {id: 123, full_name: 'John Smith'},
                    {id: 456, full_name: 'Paul Murphy'}
            ]
    }
    render json: response, status: 200
  end

  def create # make a new team
    # params = {quiz_event_id: 1, name: 'Some team name', app_version: '0.0.0'}
    # curl http://localhost:3000/api/v1/teams method POST

    # create a team
    @quiz_event = QuizEvent.where(id: params[:team][:quiz_event_id].to_i).happening_soon.first
    if @quiz_event.nil?
      render json: {message: 'Event not found'}, status: 404
    else
      @team = @quiz_event.teams.build(team_params)
      if @team.save
        render json: @team, each_serializer: Api::V1::TeamSerializer, status: 201
      else
        render json: {message: 'Team could not be created'}, status: 422
      end
    end
  end

  def update
    params = {id: 123, event_guid: 'ABC123', name: 'Some team name',
              app_version: '10.3.1'}
    # handles renaming a team
    response = {
            id: 456,
            name: 'Some team name',
            quiz_event_id: 123,
            event_team_members: ['whatever members it currently has']
    }
    render json: response, status: 200
    # send a pusher event to all team members
  end

  protected

  def team_params
    params.require(:team).permit(:name, :quiz_event_id)
  end

end
