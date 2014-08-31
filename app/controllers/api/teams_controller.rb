class Api::TeamsController < Api::BaseController

  respond_to :json

  before_action :authentication_required

  def index
    params = {event_guid: 'ABC123'}
    # get a list of teams for my event
    render json: {teams: [
            {name: 'The Army Ants', members: 1, team_guid: 'ABC123'},
            {name: 'The Perpetual Motion Squad', members: 4, team_guid: 'ABC124'}
    ]}
  end

  def create # make a new team
    params = {event_guid: 'ABC123', name: 'Some',
              app_version: '10.3.1', platform: 'IOS', device: 'iPhone 5s',
              tablet: false, pc: false, phone: true}
    # capture the app details
    # create a team
    # join the creator into the team
    render json: {team_guid: 'ABCDE12345'}, status: 201
  end

  def update # join
    params = {id: 'event_guid_here', player_guid: 'ABCDEFG1234567', team_guid: 'ABCDE12345'}
    # find the event based on the other player's guid
    if params[:player_guid] || params[:team_guid]
      if params[:player_guid]
        # find the other player
        # find the other player's team
        # Join the team
        # Link to the event if not already linked
      elsif params[:team_guid]
        # find the team based on the guid
        # Join the team
        # Link to the event if not already linked
      end
      # disconnect them from their current team, if any
      render json: {team_name: 'The Isotopes'}, status: 201
    else
      Rails.logger.error 'API:TeamsController#update error 422 ' # todo
      render json: {}, status: 422
    end
  end

end
