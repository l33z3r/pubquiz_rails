class Api::V1::QuizEventsController < Api::V1::BaseController

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
            quiz_event: {
                    name: 'The name of the event',
                    time_zone: 'Dublin',
                    starts_at: event.starts_at.to_i,
                    venue_id: 123,
                    event_guid: 'Something',
                    sponsor_logo_url: 'Something',
                    open_to_the_public: true,
                    quiz_rounds: [
                            {id: 123, sorting_order: 10, name: 'Lorem ipsum',
                             quiz_round_question_ids: [1, 2, 3]},
                            {id: 456, sorting_order: 20, name: 'Lorem ipsum',
                             quiz_round_question_ids: [4, 5, 6]},
                            {id: 789, sorting_order: 30, name: 'Lorem ipsum',
                             quiz_round_question_ids: [7, 8, 9]}
                    ],
                    quiz_round_question: [
                          {id: 1234567,
                           question_id: 1234567,
                           quiz_round_id: 123,
                           sorting_order: 10,
                           visible_text: "Who is Alonso's team mate at Ferrari in 2013?",
                           question_answers: [
                                   {visible_text: 'Filipe Masse', id: 123},
                                   {visible_text: 'Foghorn Leghorn', id: 124},
                                   {visible_text: 'Chilton Pike', id: 125},
                                   {visible_text: 'Michael Schumaker', id: 126},
                           ],
                           time_limit_seconds: 10,
                           points_available: 20
                          },
                          # etc.
                  ]
          }
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

end
