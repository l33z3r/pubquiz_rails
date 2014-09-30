require 'spec_helper'

describe Api::QuizMaster::PeopleController do
  describe 'routing' do

    it 'routes to #index' do
      get('/api/quiz_master/people/1').should route_to('api/quiz_master/people#index', quiz_event_id: '1')
    end

    it 'routes to #index' do
      get('/api/quiz_master/people/1/2').should route_to('api/quiz_master/people#index', quiz_event_id: '1', quiz_round_id: '2')
    end

    it 'routes to #show' do
      get('/api/quiz_master/player/1/2').should route_to('api/quiz_master/people#show', quiz_event_id: '1', event_team_member_id: '2')
    end

  end
end