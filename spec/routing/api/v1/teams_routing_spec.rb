require 'spec_helper'

describe Api::V1::TeamsController do
  describe 'routing' do

    it 'routes to #index' do
      get('/api/v1/teams').should route_to('api/v1/teams#index')
    end

    it 'routes to #show' do
      get('/api/v1/teams/1').should route_to('api/v1/teams#show', id: '1')
    end

    it 'routes to #create' do
      post('/api/v1/teams').should route_to('api/v1/teams#create')
    end

    it 'routes to #update' do
      put('/api/v1/teams/1').should route_to('api/v1/teams#update', id: '1')
    end

  end
end
