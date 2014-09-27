class Api::V1::SubmittedAnswersController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required

  def update
    # user submits their answer
    # PUT  http://localhost:3000/api/v1/submitted_answers/1
    # params = {id: 123, submitted_answer: {question_answer_id: 345, question_asked_at: 1234567890,
    #                                       question_answered_at: 1233456789} }

    @submitted_answer = current_user.submitted_answers.where(id: params[:id].to_i).first
    if @submitted_answer
      if current_user == false # todo .locked_out?
        render json: {message: 'User is locked out'}, status: 403
      else
        if @submitted_answer.update_attributes(update_attributes)
          render json: @submitted_answer, serializer: Api::V1::SubmittedAnswerSerializer, status: 200
        else
          render json: {message: 'Submitted Answer not updated'}, status: 422
        end
      end
    else
      render json: {message: 'Submitted Answer not found'}, status: 404
    end
  end

  protected

  def update_params
    params.require(:submitted_answer).permit(:question_answer_id, :question_asked_at, :question_answered_at)
  end

end