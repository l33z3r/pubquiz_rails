class Api::V1::TeamsController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required

  def index
    # params = {quiz_event_id: 'ABC123'}
    # http://localhost:3000/api/v1/teams?quiz_event_id=1
    # get a list of teams for my event
    @teams = Team.where(quiz_event_id: params[:quiz_event_id].to_i)

    render json: {teams: [
            {name: 'The Army Ants', members: 1, id: 123},
            {name: 'The Perpetual Motion Squad', members: 4, id: 456}
    ]}
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
