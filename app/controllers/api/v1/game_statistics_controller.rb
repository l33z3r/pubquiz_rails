class Api::V1::GameStatisticsController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required

  def index
    params = {event_guid: 'ABC123'}
    # get statistics for the entire event
    # if game is has started and has not finished > 24 hours ago
      render json: {
              teams: [
                      {team_guid: 'ABC123', name: 'The Army Ants', players: 1, score: 785},
                      {team_guid: 'ABC456', name: 'The Perpetual Motion Squad', players: 4, score: 820}
              ],
              players: [
                      {name: 'Sheldon Lee Cooper', team_guid: 'ABC123', score: 785},
                      {name: 'Leonard Hoffstader', team_guid: 'ABC456', score: 205},
                      {name: 'Howard Walowitz', team_guid: 'ABC456', score: 205},
                      {name: 'Leslie Winkel', team_guid: 'ABC456', score: 205},
                      {name: 'Raj Kuthrapali', team_guid: 'ABC456', score: 205},
              ]
      }, status: 200
    # else
      # game is over > 24 hours ago
      # Rails.logger.error 'API:GameStatisticsController#index error 410 - game over'
      # render json: {}, status: 410
    # end
  end

  def show
    params = {id: 'ABCDEFG123456'} # team_guid
    # get statistics for the the team
    if params[:team_guid]
      # todo
      render json: {}, status: 200
    else
      Rails.logger.error 'API:GameStatisticsController#show error 422 ' # todo
      render json: {}, status: 422
    end
  end

end