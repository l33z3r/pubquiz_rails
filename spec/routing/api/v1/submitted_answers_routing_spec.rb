require 'spec_helper'

describe Api::V1::SubmittedAnswersController do
  describe 'routing' do

    it 'routes to #update' do
      put('/api/v1/submitted_answers/1').should route_to('api/v1/submitted_answers#update', id: '1')
    end

  end
end
