require 'spec_helper'

describe 'GameStatistics' do
  describe 'routing' do

    it 'routes to #index' do
      get('/api/v1/game_statistics').should route_to('api/v1/game_statistics#index')
    end

    it 'routes to #show' do
      get('/api/v1/game_statistics/1').should route_to('api/v1/game_statistics#show', id: '1')
    end

  end
end