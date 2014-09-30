require 'spec_helper'

describe Api::QuizMaster::TeamsController do
  describe 'routing' do

    it 'routes to #index' do
      get('/api/quiz_master/teams/1/2').should route_to('api/quiz_master/teams#index', quiz_event_id: '1', quiz_round_id: '2')
    end

    it 'routes to #index' do
      get('/api/quiz_master/teams/1').should route_to('api/quiz_master/teams#index', quiz_event_id: '1')
    end

  end
end