class Api::EventsController < Api::BaseController

  respond_to :json

  before_action :authentication_required

  def index # list all nearby events
    # sample URL:
    # http://localhost:3000/api/events?lat=53.5&lon=-6.0&accuracy=100
    #
    # Find a list of possible events based on lat/lon or request.ip_address, and the current time
    range_in_degrees = (params[:accuracy] || 5).to_f * 0.01 # 0.1 will need fine-tuning later
    if params[:lat].to_f == 0.0 && params[:lon].to_f == 0.0
      @events = nil
      render json: {}, status: 404
    else
      @events = QuizEvent.near(params[:lat].to_f, params[:lon].to_f, range_in_degrees).happening_soon
      render 'api/events/index.json.rabl', status: 200
    end
  end

  def show
    # sample URL
    # http://localhost:3000/api/events/WKZEDcEP
    params = {id: 'ABC123'} # event_guid
    if current_user # is registered in the event AND it's within 15 minutes of the start time
    render json: {
            teams: [
                    {team_name: 'Frank Moss'},
                    {team_name: 'Jim Henderson'}
            ],
            rounds: [
                    {running_order: 10, name: 'Lorem ipsum',
                     category_name: 'Formula 1', id: 123},
                    {running_order: 20, name: 'Lorem ipsum',
                     category_name: 'Premiership', id: 124},
                    {running_order: 30, name: 'Lorem ipsum',
                     category_name: 'General Knowledge', id: 125}
            ],
            questions: [
                    {quiz_round_question_id: 1234567,
                     round_id: 123,
                     sorting_order: 10,
                     visible_text: "Who is Alonso's team mate at Ferrari in 2013?",
                     answers: [
                             {visible_text: 'Filipe Masse', id: 123},
                             {visible_text: 'Foghorn Leghorn', id: 124},
                             {visible_text: 'Chilton Pike', id: 125},
                             {visible_text: 'Michael Schumaker', id: 126},
                     ],
                     time_limit_seconds: 10,
                     points_available: 20
                    },
                    {quiz_round_question_id: 9876543,
                     round_id: 123,
                     sorting_order: 20,
                     visible_text: "Who was Alonso's team mate at Ferrari in 2013?",
                     answers: [
                             {visible_text: 'Filipe Masse', id: 127},
                             {visible_text: 'Filipe Hasse', id: 128},
                             {visible_text: 'Filipe Tasse', id: 129},
                             {visible_text: 'Filipe Basse', id: 130}
                     ],
                     time_limit_seconds: 10,
                     points_available: 20}
            ]
    }, status: 200
    elsif current_user #is in the team
      # it's too early
      Rails.logger.error 'API:EventsController#show error 403 player tried to link too early' # todo
      render json: {}, status: 403 # forbidden
    else
      # player is not in that event
      Rails.logger.error 'API:EventsController#Show error 406 player not linked to event' # todo
      render json: {}, status: 406 # not acceptable
    end
  end

  def create # join an event
    params = {id: 'ABC123'} # event_guid
    # find event using event_id
    # register the user into the event
    # if it went ok
      render json: {}, status: 201
    # else
      Rails.logger.error 'API:EventsController#create error 422 failed to link user to event: ' # todo
      render json: {}, status: 422
    # end
  end

end
