class Api::QuizMaster::PeopleController < Api::QuizMaster::BaseController

  def index
    # GET  http://localhost:3000/api/quiz_master/people/:quiz_event_id(/:quiz_round_id)
    # required params[:quiz_event_id]
    # optional params[:quiz_round_id]
    if params[:quiz_round_id]
      score_data = @quiz_event.submitted_answers.where(quiz_round_id: params[:quiz_round_id].to_i).group(:event_team_member_id).sum(:points_scored)
    else
      score_data = @quiz_event.submitted_answers.group(:event_team_member_id).sum(:points_scored)
    end
    results = []
    @quiz_event.event_team_members.each do |player|
      results << {id: player.id, name: player.user.name,
                  score: score_data[player.id].to_i,
                  quiz_round_id: params[:quiz_round_id].to_i,
                  quiz_event_id: @quiz_event.id}
    end
    render json: {people: results}, status: 200
  end

  def show
    # GET  http://localhost:3000/api/quiz_master/player/:quiz_event_id/:event_team_player_id
    # required params[:quiz_event_id], params[:event_team_player_id]
    @event_team_member = @quiz_event.event_team_members.where(id: params[:event_team_member_id].to_i).first
    if @event_team_member
      score_data = @event_team_member.submitted_answers.group(:quiz_round_id).sum(:points_scored)
      results = {id: @event_team_member.id, name: @event_team_member.user.name,
                 quiz_event_id: @quiz_event.id,
                 rounds: []}
      @quiz_event.quiz_rounds.each do |round|
        results[:rounds] << {id: round.id, name: round.name, sorting_order: round.sorting_order,
                score: score_data[round.id].to_i}
      end
      render json: {player: results}, status: 200
    else
      render json: {message: 'Player not found'}, status: 404
    end
  end
end
