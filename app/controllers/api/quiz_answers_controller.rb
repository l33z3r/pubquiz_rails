class Api::QuizAnswers < Api::BaseController

  before_action :authentication_required

  def create
    params = {event_guid: 'ABCDEFG1234567',
              quiz_round_question_id: 1234567,
              answer_id: 1234567,
              question_start_at_epoch: 1234567890123,
              question_answered_at_epoch: 1234567890123
    }
    # build and save the answer
    # if submitted_answer.save
      render json: {quiz_round_question_id: 1234567}, status: 201
    # else
      Rails.logger.error 'API:QuizAnswers#create error 422 ' # todo
      render json: {quiz_round_question_id: 1234567}, status: 422
    # end
  end

end