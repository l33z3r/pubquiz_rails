class Api::QuizMaster::TeamsController < Api::QuizMaster::BaseController

  respond_to :json

  before_action :logged_in_required

  def index
    # required params[:quiz_event_id]
    # optional params[:quiz_round_id]
    @quiz_event = current_user.quiz_events.where(id: params[:quiz_event_id].to_i).first
    if @quiz_event
      @teams = @quiz_event.try(:teams)
      if @teams
        @quiz_round_id = @quiz_event.quiz_rounds.where(id: params[:quiz_round_id].to_i).first.try(:id)
        if @quiz_round_id
           summary_data = SubmittedAnswer.includes(:quiz_round_question).where('quiz_round_questions.quiz_round_id = ?', @quiz_round_id).group(:team_id).references(:quiz_round_question)
        else
          summary_data = @quiz_event.submitted_answers.group(:team_id)
        end
        @scores = summary_data.map {|x| [x.team_id, x.sum(:points_scored)] }
        render json: @teams, serializer: Api::QuizMaster::TeamsSerializer
      else
        render json: {message: 'Teams not found'}, status: 404
      end
    else
      render json: {message: 'Quiz Event not found'}, status: 404
    end
  end

end