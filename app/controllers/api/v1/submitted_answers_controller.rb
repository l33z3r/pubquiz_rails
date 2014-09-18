class Api::V1::SubmittedAnswersController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required

  def update
    # user submits their answer
    params = {id: 123, submitted_answer: {question_answer_id: 345, question_asked_at: 1234567890, question_answered_at: 1233456789} }
    response = {event_team_member_id: 12345,
                quiz_round_question_id: 123,
                question_answer_id: nil
    }
    if 'user_is_not_locked_out_of_this_round'
      render json: response, status: 200
    else
      render json: 'unchanged_response', status: 422
    end
  end

end