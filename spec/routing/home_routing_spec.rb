require 'spec_helper'

describe HomeController do
  describe 'routing' do

    it 'routes to #index' do
      get('/home/index').should route_to('home#index')
      get('/').should route_to('home#index')
    end

    it 'routes to #how_it_works' do
      get('/how_it_works').should route_to('home#how_it_works')
    end

  end
end
