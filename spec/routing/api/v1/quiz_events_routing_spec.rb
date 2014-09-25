require 'spec_helper'

describe Api::V1::QuizEventsController do
  describe 'routing' do

    it 'routes to #index' do
      get('/api/v1/quiz_events').should route_to('api/v1/quiz_events#index')
    end

    it 'routes to #show' do
      get('/api/v1/quiz_events/1').should route_to('api/v1/quiz_events#show', id:'1')
    end

    it 'routes to #create' do
      post('/api/v1/quiz_events').should route_to('api/v1/quiz_events#create')
    end

  end
end
