require 'spec_helper'

describe SessionsController do
  describe 'routing' do

    # get 'auth/:provider/callback', to: 'sessions#create'
    # get 'auth/failure', to: redirect('/')
    # post 'signout', to: 'sessions#destroy', as: 'signout'

    it 'routes to create' do
      get('auth/friend_face/callback').should route_to('sessions#create', provider: 'friend_face')
    end

    it 'routes to root on failure' do
      get('auth/failure').should route_to('home#index')
    end

    it 'routes to signout' do
      post('signout').should route_to('sessions#destroy')
    end

  end
end
