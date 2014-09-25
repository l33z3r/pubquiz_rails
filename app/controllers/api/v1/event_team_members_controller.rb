class Api::V1::EventTeamMembersController < Api::V1::BaseController

  # todo

  respond_to :json

  before_action :authentication_required

  def show
    # shows the details for one team member
    params = {id: 12345}
    response = {
            id: 12345,
            team_id: 123,
            user_id: 456,
            quiz_event_id: 789,
            backgrounded: false,
            submitted_answers: [
                    {event_team_member_id: 12345,
                     quiz_round_question_id: 123,
                     question_answer_id: nil
                    } # one of these for every question in the quiz
            ]
    }
    render json: response, status: 200
  end

  def create
    # joins the current_user to the team
    params = {team_id: 123}

    response = {
            id: 12345,
            team_id: 123,
            user_id: 456,
            quiz_event_id: 789,
            backgrounded: false,
            submitted_answers: [
                    {event_team_member_id: 12345,
                     quiz_round_question_id: 123,
                     question_answer_id: nil
                    } # one of these for every question in the quiz
            ]
    }
    render json: response, status: 200
  end

  def update
    # allows the current_user to move between teams BEFORE THE EVENT STARTS
    params = {id: 123, event_team_member: {team_id: 123, bacckgrounded: true/false}}
    response = {
            id: 12345,
            team_id: 123,
            user_id: 456,
            quiz_event_id: 789,
            submitted_answers: [
                    {event_team_member_id: 12345,
                     quiz_round_question_id: 123,
                     question_answer_id: nil
                    } # one of these for every question in the quiz
            ]
    }
    render json: response, status: 200
  end

end