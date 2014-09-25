class Api::V1::TeamsController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required

  def index
    # http://localhost:3000/api/v1/teams?quiz_event_id=1

    # first, find the event.
    @quiz_event = QuizEvent.where(id: params[:quiz_event_id].to_i).happening_soon.first

    if @quiz_event.nil?
      render json: {message: 'Event not found'}, status: 404
    else
      # get a list of teams for my event
      @teams = @quiz_event.teams
      Rails.logger.debug @teams.inspect
      render json: @teams, each_serializer: Api::V1::TeamsSerializer, status: 200
    end
  end

  def show
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
    params = {event_guid: 'ABC123', name: 'Some team name',
              app_version: '10.3.1'}
    # capture the app details
    # create a team
    # DO NOT join the creator into the team - Need a second API call for this
    response = {
            id: 456,
            name: 'Some team name',
            quiz_event_id: 123,
            event_team_members: []
    }
    render json: response, status: 201
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

end
