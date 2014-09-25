require 'spec_helper'

describe Api::V1::EventTeamMembersController do
  describe 'routing' do

    it 'routes to #show' do
      get('/api/v1/event_team_members/1').should route_to('api/v1/event_team_members#show', id: '1')
    end

    it 'routes to #create' do
      post('/api/v1/event_team_members').should route_to('api/v1/event_team_members#create')
    end

    it 'routes to #update' do
      put('/api/v1/event_team_members/1').should route_to('api/v1/event_team_members#update', id: '1')
    end

  end
end
