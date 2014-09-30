class Api::QuizMaster::TeamsController < Api::QuizMaster::BaseController

  def index
    # required params[:quiz_event_id]
    # optional params[:quiz_round_id]
    @teams = @quiz_event.try(:teams)
    if @teams
      if params[:quiz_round_id]
        summary_data = @quiz_event.submitted_answers.where(quiz_round_id: params[:quiz_round_id].to_i).group(:team_id).sum(:points_scored)
      else
        summary_data = @quiz_event.submitted_answers.group(:team_id).sum(:points_scored)
      end
      results = []
      @teams.each do |team|
        results << {id: team.id, name: team.name,
                    quiz_round_id: params[:quiz_round_id].to_i,
                    quiz_event_id: team.quiz_event_id,
                    score: summary_data[team.id].to_i}
      end
      render json: {teams: results}, status: 200
    else
      render json: {message: 'Teams not found'}, status: 404
    end
  end

end