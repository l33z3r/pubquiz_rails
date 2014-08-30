class Api::EventsController < Api::BaseController

  before_action :authentication_required

  def index # list all nearby events
    params = {lat: 53.123, lon: -6.123, accuracy: 10}
    # Find a list of possible events based on lat/lon or request.ip_address, and the current time
    render json: {events: [
            {name: 'Weekly table quiz', starts_at_epoch: 1409360642,
             description: 'Lorem ipsum 1', time_zone_offset_minutes: 60, in_dst: true,
             location: "Tippsy McStagger's Good-Time Emporium",
             address: '123 Fake Street, Springfield', event_guid: 'ABC123'},
            {name: 'Fundraiser for Duff Man', starts_at_epoch: 1409360642,
             description: 'Lorem ipsum 2',
             location: "Moe's Tavern", time_zone_offset_minutes: 60, in_dst: true,
             address: 'Evergreen Terrace, Springfield', event_guid: 'ABC456'}
    ]}, status: 200
  end

  def show
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
