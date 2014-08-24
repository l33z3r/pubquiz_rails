require 'spec_helper'

describe SessionsController do
  describe 'routing' do

    it 'routes to create' do
      get('/auth/friend_face/callback').should route_to('sessions#create', provider: 'friend_face')
    end

    it 'routes to signout' do
      post('/signout').should route_to('sessions#destroy')
    end

  end

  describe 'redirection', type: :request do
    it 'routes to root on failure' do
      get('/auth/failure')
      response.should redirect_to(root_url)
    end
  end

end
