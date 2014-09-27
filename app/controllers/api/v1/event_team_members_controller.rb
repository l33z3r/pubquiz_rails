class Api::V1::EventTeamMembersController < Api::V1::BaseController

  respond_to :json

  before_action :authentication_required

  def show
    # shows the details for one team member
    # GET  http://localhost:3000/api/v1/event_team_members/3
    my_team_id = current_user.event_team_members.last.try(:team_id)
    if my_team_id
      @event_team_member = EventTeamMember.where(id: params[:id].to_i, team_id: my_team_id).first
      if @event_team_member
        render json: @event_team_member, serializer: Api::V1::EventTeamMemberSerializer, status: 200
      else
        render json: {message: 'Team member not found'}, status: 404
      end
    else
      render json: {message: 'Join a team first'}, status: 401
    end
  end

  def create
    # joins the current_user to the team
    # POST http://localhost:3000/api/v1/event_team_members
    # params = {event_team_member: {quiz_event_id: 1, team_id: 3}}
    @event_team_member = current_user.event_team_members.build(create_params)
    if @event_team_member.save
      render json: @event_team_member, serializer: Api::V1::EventTeamMemberSerializer, status: 201
    else
      render json: {message: 'Could not be saved'}, status: 422
    end
  end

  def update
    # allows the current_user to move between teams BEFORE THE EVENT STARTS
    # PUT http://localhost:3000/api/v1/event_team_members/3
    # params = {id: 1, event_team_member: {quiz_event_id: 1, team_id: 3}}
    @event_team_member = current_user.event_team_members.where(id: params[:id].to_i).first
    if @event_team_member # todo && @event_team_member.quiz_event.not_started_yet
      if @event_team_member.update_attributes(update_params)
        render json: @event_team_member, serializer: Api::V1::EventTeamMemberSerializer, status: 201
      else
        render json: {message: 'EventTeamMember not updated}, status: 422'}
      end
    else
      render json: {message: 'Event Team Member not found'}, status: 404
    end
  end

  protected

  def create_params
    params.require(:event_team_member).permit(:team_id, :quiz_event_id)
  end

  def update_params
    params.require(:event_team_member).permit(:team_id)
  end

end